# ---- Config ----
PRESET       ?= debug

OUT_DIR		 ?= build
BUILD_DIR    := $(OUT_DIR)/$(PRESET)

TARGET       ?= @NAME@
ARGS		 ?=

# ---- Phony targets ----
.PHONY: preset build run clean rebuild check

# Equivalent to: cargo build
build:
	cmake --preset $(PRESET)
	cmake --build $(BUILD_DIR) -DBUILD_SHARED_LIBS=@LINKER@

# Equivalent to: cargo run
run: build
	clear
	ln -sf $(BUILD_DIR)/compile_commands.json compile_commands.json
	./$(BUILD_DIR)/$(TARGET) $(ARGS)

# Equivalent to: cargo clean
clean:
	rm -rf $(OUT_DIR)
	rm -rf .cache
	rm -rf compile_commands.json
	rm -rf CMakeFiles
	rm -f CMakeCache.txt

# Equivalent to: cargo build --force
rebuild: clean build

# Equivalent to: cargo check (fast compile, no link)
check:
	cmake --preset $(PRESET)
	cmake --build $(BUILD_DIR) --target $(TARGET) -DBUILD_SHARED_LIBS=@LINKER@ -- -n

install: build
	cmake --install $(BUILD_DIR)

uninstall:
	cmake --build $(BUILD_DIR) --target uninstall
