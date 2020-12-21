# Go: Vanilla Setup

TODO general intro
[go]

Note: to recreate this setup via docker checkout
[go.Dockerfile](go.Dockerfile) and run:
```bash
docker build --tag sxiym:go -f docs/go.Dockerfile . && \
docker run -it sxiym:go
```

TODO https://golang.org/doc/code.html

## Basic Setup

## Packaging

## Testing
TODO [go testing]

## Linting/Formatting
TODO `gofmt`

## Editor/IDE
[VSCode] and the [go plugin] provide rich language support for go.
Install the [go plugin] with `Ctrl-P`:
```
ext install golang.Go
```

<!-- LINKS -->
[VSCode]: https://code.visualstudio.com/
[go plugin]: https://code.visualstudio.com/docs/languages/go
[go]: https://golang.org
[go install instructions]: https://golang.org/doc/install
[go testing]: https://golang.org/doc/code.html#Testing
