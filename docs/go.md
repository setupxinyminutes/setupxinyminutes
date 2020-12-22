# Go: Vanilla Setup

> "Go is an open source programming language that makes it easy to build simple, reliable, and efficient software"
> -- https://golang.org/

[go] TODO general intro

Note: to recreate this setup via docker checkout
[go.Dockerfile](go.Dockerfile) and run:

```bash
docker build --tag sxiym:go -f docs/go.Dockerfile . && \
docker run -it sxiym:go
```


## Basic Setup

Follow [go install instructions] for your platform.
This puts go into `/usr/local/go`.
Make sure `/usr/local/go/bin` and `~/go/bin` are part of your `$PATH`
```bash
echo "PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> ~/.bashrc
```

In a new terminal you should be able to say
```bash
go version
```

```bash
# Install the go language server (used by VSCode)
go get -v golang.org/x/tools/gopls
```

## Packaging

## Testing
TODO [go testing]

## Formatting/Linting
`gofmt`, the default formatter, comes directly with go so you never have to
argue about go code style.

`golint` is the default linter for go.
Install it like this:
```bash
go get -u golang.org/x/lint/golint
```

## Editor/IDE
[VSCode] and the [go plugin] provide rich language support for go.
Install the [go plugin] with `Ctrl-P`:
```
ext install golang.Go
```

When you open a go file with VSCode you are prompted to install a few
dependencies.
For completeness sake here are the dependencies that get installed:
```bash
TODO see Dockerfile
```


<!-- LINKS -->
[VSCode]: https://code.visualstudio.com/
[go code organization]: https://golang.org/doc/code.html
[go install instructions]: https://golang.org/doc/install
[go plugin]: https://code.visualstudio.com/docs/languages/go
[go testing]: https://golang.org/doc/code.html#Testing
[go]: https://golang.org
