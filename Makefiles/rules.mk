include cfg/.env

# Targets
.PHONY: all test clean

# Commands
CMAKE := /usr/bin/cmake
CTEST := /usr/bin/ctest
MKDIR := mkdir -p
RMDIR := rm -rf

CMAKE_DEBUG_FLAGS := -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE --no-warn-unused-cli
CMAKE_RELEASE_FLAGS := -DCMAKE_BUILD_TYPE:STRING=Release

# Build Commands
CMAKE_CONFIG := $(CMAKE) -S $(TOP_DIR) -B $(BUILD_DIR)
CMAKE_BUILD := $(CMAKE) --build $(BUILD_DIR) --parallel

DEBUG_CMD := $(CMAKE_CONFIG) $(CMAKE_DEBUG_FLAGS) && $(CMAKE_BUILD)
RELEASE_CMD := $(CMAKE_CONFIG) $(CMAKE_RELEASE_FLAGS) && $(CMAKE_BUILD)
TEST_CMD := $(CTEST) --test-dir $(BUILD_DIR) --output-on-failure --verbose
RUN_CMD := $(BUILD_DIR)/$(DEBUG_EXEC)
CLEAN_CMD := $(RMDIR) $(BUILD_DIR)
