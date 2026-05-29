include cfg/.env
include Makefiles/rules.mk

# Targets
.PHONY: all debug release test clean run

all: clean debug

debug:
	@$(DEBUG_CMD)

release:
	@$(RELEASE_CMD)

test: debug
	@$(TEST_CMD)

run: debug
	@$(RUN_CMD)

clean:
	@$(CLEAN_CMD)
