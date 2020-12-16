# Python3: Vanilla Setup

This is a pretty vanilla setup for python 3 which uses the following tools:

- Editor/IDE: [VSCode] [PyLance]
- Package manager: [poetry]
- Linter: [flake8] [PyLance]
- Formatter: [black]
- Testing: [pytest] [doctests]
- Type checker: [PyLance]

With your system package manager install a recent version of python
(e.g. 3.8 or 3.9, [more details](https://www.python.org/doc/versions/))
and [ipython] (better REPL with syntax highlighting and auto completion)
```bash
# Ubuntu/Debian
sudo apt install python3.8 ipython

# TODO macOS
# brew install ???

# TODO Windows
# brew install ???
```


## Packaging

**TL;DR:**
use [poetry] to create projects, manage/install dependencies and
virtualenvs;
use [pipx] to install python programs.

[pip], the python package installer,
allows you to install packages from [PyPI], the python package index.
It is best practice to install packages into so called "virtual environments",
or "virtualenvs" for short.
They separate dependencies from other projects and system dependencies.
The CLI [virtualenv], or `python -m venv`, are used to create virtualenvs for you.

Nowadays, high-level tools like [poetry] get more popular.
Poetry describes itself as "Python packaging and dependency management made easy".
It creates a basic project structure for you,
manages the project's metadata and dependencies (via `pyproject.toml` and `poetry.lock`),
can publish your packages to PyPI,
and much more.

There is another useful tool, `pipx` which install python command line tools.
`pipx` automatically creates and manages virtualenvs for each installed program for you.


### Setup

```bash
# Install pip - see https://pip.pypa.io/en/stable/installing/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# Install pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# In a new shell install poetry via pipx
python3 -m pipx install --user poetry
```


### Create your first project

```bash
# create a new project
poetry new my_fancy_project
cd my_fancy_project
# Enter (and create) the virtualenv
poetry shell

# Add dependencies, e.g. the `requests` lib.
# This adds an entry to pyproject.toml and pins the version in poetry.lock
poetry add requests

# Check out the project structure
tree .
# .
# ├── my_fancy_project
# │   └── __init__.py
# ├── pyproject.toml
# ├── poetry.lock
# ├── README.rst
# └── tests
#     ├── __init__.py
#     └── test_my_fancy_project.py

# Add dev dependencies, e.g. black, flake8, pytest
poetry add --dev black flake8 pytest
```

`pyproject.toml` contains list the newly added dependencies.
`poetry.lock` pins the exact versions of the dependencies.


## Testing: pytest and doctests

Python comes with two testing libs included: [unittest] and [doctests].

Doctests are great for testing and documenting the behavior of simple functions,
e.g.:
```python
# file: my_fancy_project/utils.py
def inc(a: int) -> int:
    """Increment the given number by one.

    Examples:
        >>> inc(0)
        1
        >>> inc(1)
        2
    """
    return a + 1
```

The `unittest` lib works well,
but the alternative [pytest]
allows you to write tests with less boilerplate,
has great fixture handling,
and supports lots of third party plugins.

Pytest conventions:

- All tests go into the `tests/` folder.
- Test files have a `test_` prefix.
- Test functions have a `test_` prefix.
- Tests just use a simple `assert` statement.

Example:
```python
# file: tests/test_utils.py.
from my_fancy_project.utils import inc

def test_inc():
    assert inc(3) == 4
```

Now you can run all tests (and doctests) with `pytest`:
```bash
pytest --doctest-modules
```

## Linting and Formating: `flake8` and `black`
[flake8] is a commonly used linter.
[black] is code formatter with strong opinions that cannot be configured.
Code always looks the same.
Both tools play well with VSCode.

However, `flake8` has to be configured to use the 88 char line length that
`black` uses:
```
# file: .flake8
[flake8]
max-line-length = 88
```

## Editor/IDE

[VSCode] with the python plugin [PyLance] is a good choice as editor.
You get decent auto-completion, test running, debugging, linting, etc.
It also integrates well with poetry (auto-detects the environments).



## Type checking

Python supports optional [type hints](https://www.python.org/dev/peps/pep-0484/).
They are not used at runtime, but can be used by tools to do linting and
improve auto-completion.
By using [VSCode] and [PyLance] you already get improved linting and
auto-completion if you add type annotations to your code.

Alternatively or complementarity to using VSCode you can use dedicated tools
like [mypy] ("Mypy is an optional static type checker for Python").

For more details regarding type hints checkout
[https://realpython.com/python-type-checking/](https://realpython.com/python-type-checking/).


<!-- LINKS -->
[PyLance]: https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
[PyPI]: https://pypi.org/
[VSCode]: https://code.visualstudio.com/
[black]: https://black.readthedocs.io/en/stable/
[doctests]: https://docs.python.org/3/library/doctest.html
[flake8]: https://flake8.pycqa.org/en/latest/
[ipython]: https://ipython.org/
[mypy]: http://mypy-lang.org/
[pip]: https://pip.pypa.io/en/stable/
[pipx]: https://github.com/pipxproject/pipx
[poetry]: https://python-poetry.org/
[pytest]: https://docs.pytest.org/en/stable/
[unittest]: https://docs.python.org/3/library/unittest.html
[virtualenv]: https://virtualenv.pypa.io/en/latest/
