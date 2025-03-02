BUILD_DIR=build
BUILD_DIR_DEP=$(BUILD_DIR)/CMakeCache.txt
# $(export GNUMAKEFLAGS=--no-print-directory)
MAKEFLAGS += --no-print-directory

run: buildall
	@./$(BUILD_DIR)/exe
.PHONY: clean

buildall: $(BUILD_DIR_DEP) compile_commands.json
	cmake --build $(BUILD_DIR) --target all -- -j 8
.PHONY: clean

compile_commands.json: $(BUILD_DIR_DEP) ${BUILD_DIR}/compile_commands.json
	cp $(BUILD_DIR)/compile_commands.json .

$(BUILD_DIR_DEP):
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR); cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug ..

rebuild: clean buildall
.PHONY: clean

clean:
	rm -rf $(BUILD_DIR)
.PHONY: clean
