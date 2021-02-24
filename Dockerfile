FROM nvidia/cuda:11.1-base

LABEL maintainer="Sergey Cheperis"

RUN apt-get update && \
    apt-get -y install golang --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

WORKDIR /go

COPY src/app.go app.go

RUN go build -v -o bin/app app.go

EXPOSE 9202

CMD ["./bin/app"]
