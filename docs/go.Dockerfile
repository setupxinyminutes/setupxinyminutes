FROM ubuntu:20.04


RUN apt update \
    && apt install -y curl vim

# Install go
RUN curl -O https://storage.googleapis.com/golang/go1.15.6.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz

# User for Setup X In Y Minutes
RUN useradd -ms /bin/bash sxiym
USER sxiym
WORKDIR /home/sxiym


RUN echo "PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> ~/.bashrc

RUN mkdir my_fancy_project && \
    cd my_fancy_project && \
    /usr/local/go/bin/go mod init example.com/user/hello && \
    echo 'package main\nimport "fmt"\nfunc main() {\n fmt.Println("Hello, World!")\n}' > hello.go && \
    /usr/local/go/bin/go install example.com/user/hello
