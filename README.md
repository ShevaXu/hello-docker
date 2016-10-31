# Demo for build a minimal Golang Docker image and run it

```
CGO_ENABLED=0 GOOS=linux go build -o hello

docker build -t demo/hello .

docker run -d -P demo/hello
```
