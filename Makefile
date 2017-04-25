OUT_DIR=bin

all: build

build:
	mkdir -p $(OUT_DIR)
	crystal build --release main.cr -o $(OUT_DIR)/main

run:
	$(OUT_DIR)/main

clean:
	rm -rf  $(OUT_DIR) .crystal .deps libs
