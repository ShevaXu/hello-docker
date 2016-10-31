# Demo for build a minimal Golang Docker image and run it

## Prerequisites

* [Go](https://golang.org/)
* [Docker](https://www.docker.com/)

## Commands

```
CGO_ENABLED=0 GOOS=linux go build -o hello

docker build -t demo/hello .

docker run -d -P demo/hello
```

Or just run `./app.sh`

## License

MIT