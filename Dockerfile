FROM golang
COPY ./protoc/bin/protoc /bin/protoc
COPY ./protoc/include /usr/local/include/
RUN go get github.com/AsynkronIT/protoactor-go/... &&\
    cd $GOPATH/src/github.com/AsynkronIT/protoactor-go &&\
    go get ./... &&\
    make
RUN apt-get -qq update &&\
    apt-get -y install -qq swig3.0 &&\
    rm -rf /var/lib/apt/lists/* &&\
    ln -s /usr/bin/swig3.0 /usr/bin/swig
WORKDIR /go/src/github.com/rolevax/ih/
RUN go get github.com/fatih/camelcase &&\
    go get github.com/rolevax/sp4g &&\
    go get github.com/chzyer/readline &&\
    go get github.com/go-pg/pg &&\
    go get github.com/howeyc/gopass &&\
    go get github.com/emicklei/go-restful &&\
    go get github.com/dgrijalva/jwt-go &&\
    go get github.com/go-redis/redis &&\
    go get github.com/importcjj/sensitive &&\
    go get github.com/microcosm-cc/bluemonday

