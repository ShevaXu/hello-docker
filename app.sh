#!/usr/bin/env bash

echo ">> Build app ..."
CGO_ENABLED=0 GOOS=linux go build -o hello

echo ">> Build image ..."
docker build -t demo/hello .

echo ">> Run app ..."
docker run -d -P demo/hello