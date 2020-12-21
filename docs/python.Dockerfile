FROM ubuntu:20.04

RUN apt update \
    && apt install -y curl vim \
    && apt install -y python3.8 python3-distutils python3-venv ipython3

# User for Setup X In Y Minutes
RUN useradd -ms /bin/bash sxiym
USER sxiym
WORKDIR /home/sxiym

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

RUN python3 -m pip install pipx
# Make sure ~/.local/bin is in PATH. Takes effect when attaching to the
# container.
RUN python3 -m pipx ensurepath

RUN python3 -m pipx install poetry

# create a project
RUN ~/.local/bin/poetry new my_fancy_project
RUN cd my_fancy_project && \
    ~/.local/bin/poetry add requests && \
    ~/.local/bin/poetry add --dev black flake8 pytest && \
    ~/.local/bin/poetry install && \
    ~/.local/bin/poetry run pytest

RUN cd my_fancy_project && \
    echo "[flake8]\nmax-line-length = 88" > .flake8

RUN cd my_fancy_project && \
    ~/.local/bin/poetry run black my_fancy_project || true && \
    ~/.local/bin/poetry run black my_fancy_project && \
    ~/.local/bin/poetry run flake8 my_fancy_project
