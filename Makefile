# binaries
DOCKER = docker
GO = go

# colors
OK_COLOR=\033[32;01m
NO_COLOR=\033[0m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

# project setting
ROOT_DIR := $(realpath .)
BIN_NAME = hello
DOCKER_TAG = demo/hello

# build flags
BUILD_DATE = $(shell date)
BUILD_HASH = $(shell git rev-parse --short HEAD)
BUILD_SIGN ?= $(BUILD_SIGN:)
# If we don't set the build sign, it defaults to dev
ifeq ($(BUILD_SIGN),)
	BUILD_SIGN := dev
endif

# envs
GOOS = $(shell $(GO) env GOOS)
GOARCH = $(shell $(GO) env GOARCH)
GOFLAGS ?= $(GOFLAGS:)
ENVFLAGS = CGO_ENABLED=0

# linker
GO_LINKER_FLAGS ?= --ldflags \
	'-X "main.BuildSign=$(BUILD_SIGN)" \
   -X "main.BuildDate=$(BUILD_DATE)" \
   -X "main.BuildHash=$(BUILD_HASH)"'

# make phases
#
all: dev

dev:
	$(GO) build $(GOFLAGS) $(GO_LINKER_FLAGS) -o $(BIN_NAME)

build:
	@echo "$(OK_COLOR)==> Building binary ($(GOOS)/$(GOARCH))...$(NO_COLOR)"
	$(ENVFLAGS) $(GO) build $(GOFLAGS) $(GO_LINKER_FLAGS) -o bin/$(GOOS)_$(GOARCH)/$(BIN_NAME) .

test:
	@echo "$(OK_COLOR)==> Running tests...$(NO_COLOR)"
	$(GO) test -v $(GOFLAGS) ./...

format:
	@echo "$(OK_COLOR)==> Formatting Code...$(NO_COLOR)"
	@$(GO) fmt $(GOFLAGS) ./...

clean:
	@echo "$(OK_COLOR)==> Cleaning...$(NO_COLOR)"
	@$(GO) clean ./...

run:
	@bin/$(GOOS)_$(GOARCH)/$(BIN_NAME) $(args)

image:
	@echo "$(OK_COLOR)==> Making docker image...$(NO_COLOR)"
	$(DOCKER) build -t $(DOCKER_TAG) .
