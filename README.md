# Demo for build a minimal Golang Docker image and run it

## Prerequisites

* [Go](https://golang.org/)
* [Docker](https://www.docker.com/)

## Commands

```sh
make image

docker run -d -p 8080:8080 demo/hello
```

## Updates

* `Makefile`, Ref. [blog](https://medium.com/smsjunk/an-in-depth-look-at-our-docker-and-ecs-stack-for-golang-b89dfe7cff5c)
* [Multi-stages build](https://docs.docker.com/engine/userguide/eng-image/multistage-build/)

## License

MIT
