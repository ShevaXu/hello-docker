FROM golang:1.9.2

# GOPATH is /go
WORKDIR /go/src/github.com/ShevaXu/hello-docker
# When using COPY with more than one source file, the destination must be a directory and end with a /
COPY . ./

# RUN make setup
RUN BUILD_SIGN=sheva make build
# TODO: the intermediate container is not removed after this step

# app
FROM alpine:latest
LABEL maintainer="Sheva Xu <shevaxu@outlook.com>"

# RUN apk add --no-cache ca-certificates

# Create app dir
WORKDIR /var/app

# Copy Binary
COPY --from=0 /go/src/github.com/ShevaXu/hello-docker/bin/linux_amd64/hello /var/app

# Run Binary
CMD ["/var/app/hello"]

EXPOSE 8080
