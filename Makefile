# ---- Config ----
PRESET       ?= default
BUILD_DIR    ?= build
TARGET       ?= app   # change if your executable has a different name

# ---- Phony targets ----
.PHONY: preset build run clean rebuild check

# Equivalent to: cargo build
build:
	cmake --preset $(PRESET)
	cmake --build $(BUILD_DIR)

# Equivalent to: cargo run
run: build
	./$(BUILD_DIR)/$(TARGET)

# Equivalent to: cargo clean
clean:
	rm -rf $(BUILD_DIR)

# Equivalent to: cargo build --force
rebuild: clean build

# Equivalent to: cargo check (fast compile, no link)
check:
	cmake --preset $(PRESET)
	cmake --build $(BUILD_DIR) --target $(TARGET) -- -n
