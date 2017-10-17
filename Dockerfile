FROM golang
COPY ./protoc/bin/protoc /bin/protoc
COPY ./protoc/include /usr/local/include/
RUN go get github.com/AsynkronIT/protoactor-go/... &&\
    cd $GOPATH/src/github.com/AsynkronIT/protoactor-go &&\
    go get ./... &&\
    make
RUN apt-get -qq update &&\
    apt-get -y install -qq swig3.0 &&\
    ln -s /usr/bin/swig3.0 /usr/bin/swig
WORKDIR /go/src/github.com/rolevax/ih/

