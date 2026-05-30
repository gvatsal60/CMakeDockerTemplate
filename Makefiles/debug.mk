include Makefiles/docker.mk
include Makefiles/rules.mk

# Define the path to the Dockerfile
DOCKER_FILE_PATH := dockerfiles/Dockerfile.debug

DOCKER_BUILD_CMD := $(DOCKER_HOST) image build -t $(DOCKER_IMG_NAME) -f $(DOCKER_FILE_PATH) $(DOCKER_BUILD_CONTEXT)
DOCKER_RUN_CMD := $(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME)
CONTAINER_SHELL := /bin/sh -lc

# Define the default target
.PHONY: all debug release test clean run

# Targets
all: clean debug

# Target: build_img
build_img:
	@$(DOCKER_BUILD_CMD)

# Debug Build
debug: build_img
	$(DOCKER_RUN_CMD) $(CONTAINER_SHELL) "$(DEBUG_CMD)"

# Release Build
release: build_img
	@$(DOCKER_RUN_CMD) $(CONTAINER_SHELL) "$(RELEASE_CMD)"

# Test code
test: debug
	@$(DOCKER_RUN_CMD) $(CONTAINER_SHELL) "$(TEST_CMD)"

# Run code
run: debug
	@$(DOCKER_RUN_CMD) $(CONTAINER_SHELL) "$(RUN_CMD)"

# Clean
clean: build_img
	@$(DOCKER_RUN_CMD) $(CONTAINER_SHELL) "$(CLEAN_CMD)"
