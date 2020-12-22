FROM ubuntu:20.04


RUN apt update \
    && apt install -y curl vim git

# Install go
RUN curl -O https://storage.googleapis.com/golang/go1.15.6.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz

# User for Setup X In Y Minutes
RUN useradd -ms /bin/bash sxiym
USER sxiym
WORKDIR /home/sxiym


# Set PATH
RUN echo "PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> ~/.bashrc

# VSCode dependencies
# Not strictly required as they get installed by VScode
# Install go language server
RUN /usr/local/go/bin/go get -u golang.org/x/tools/gopls
# golint
RUN /usr/local/go/bin/go get -u golang.org/x/lint/golint
RUN /usr/local/go/bin/go get -u golang.org/x/tools/cmd/goimports
RUN /usr/local/go/bin/go get -u github.com/stamblerre/gocode
RUN /usr/local/go/bin/go get -u github.com/mdempsky/gocode 
RUN /usr/local/go/bin/go get -u github.com/uudashr/gopkgs/v2/cmd/gopkgs
RUN /usr/local/go/bin/go get -u github.com/ramya-rao-a/go-outline
RUN /usr/local/go/bin/go get -u github.com/stamblerre/gocode
RUN /usr/local/go/bin/go get -u github.com/rogpeppe/godef

# Setup first project
RUN mkdir my_fancy_project && \
    cd my_fancy_project && \
    /usr/local/go/bin/go mod init example.com/user/hello && \
    echo 'package main\nimport "fmt"\nfunc main() {\n fmt.Println("Hello, World!")\n}' > hello.go && \
    /usr/local/go/bin/go install example.com/user/hello
