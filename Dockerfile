FROM golang:1.12.4
MAINTAINER bjfumac "macvsapple@gmail.com"

RUN mkdir /go/src/golang.org/ && \
mkdir /go/src/golang.org/x/ && \
mkdir /go/src/github.com/ && \
mkdir /go/src/github.com/golang/ && \
mkdir /go/src/github.com/garyburd/ && \
mkdir /go/src/github.com/liangdas/

WORKDIR /go/src/golang.org/x/

RUN git clone https://github.com/golang/net.git && \
git clone https://github.com/golang/text.git && \
#
git clone https://github.com/golang/crypto.git

WORKDIR /go/src/github.com/golang/
RUN git clone https://github.com/golang/protobuf.git

WORKDIR /go/src/github.com/garyburd/
RUN git clone https://github.com/garyburd/redigo.git

WORKDIR /go/src/github.com/liangdas/
RUN git clone https://github.com/liangdas/mqant-modules.git && \
git clone https://github.com/liangdas/armyant.git && \
#
git clone https://github.com/liangdas/mqant.git

RUN go get github.com/gorilla/mux
RUN go get github.com/gorilla/websocket
RUN go get github.com/streadway/amqp
RUN go get github.com/opentracing/basictracer-go
RUN go get github.com/opentracing/opentracing-go
RUN go get github.com/yireyun/go-queue
RUN go get sourcegraph.com/sourcegraph/appdash
RUN go get sourcegraph.com/sourcegraph/appdash-data
RUN go get github.com/eclipse/paho.mqtt.golang
#RUN go get github.com/liangdas/mqant
#
RUN go get github.com/Jeffail/tunny
RUN go get github.com/gomodule/redigo/redis
RUN go get github.com/nats-io/go-nats
RUN go get github.com/pkg/errors


VOLUME ["/mqantserver/"]
ENV GOPATH $GOPATH:/mqantserver
WORKDIR /

EXPOSE 8080 
EXPOSE 3653
EXPOSE 7700
EXPOSE 7701

ADD start.sh /start.sh
RUN chmod 777 /start.sh
