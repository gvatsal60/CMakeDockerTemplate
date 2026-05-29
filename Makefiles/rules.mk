include cfg/.env

# Targets
.PHONY: all test clean

# Commands
CMAKE := /usr/bin/cmake
MKDIR := mkdir -p
RMDIR := rm -rf

CMAKE_FLAGS := -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE --no-warn-unused-cli

# Build Commands
BUILD_CMD := $(CMAKE) $(CMAKE_FLAGS) -S $(TOP_DIR) -B $(BUILD_DIR)
TEST_CMD := $(TEST_DIR)/$(TEST_EXEC)
RUN_CMD := $(BUILD_DIR)/$(DEBUG_EXEC)
CLEAN_CMD := $(RMDIR) $(BUILD_DIR)
# SONAR_CMD := $(BUILD_TOOL_CMD) sonar
