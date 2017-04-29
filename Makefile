OUT_DIR=bin

all: build

build:
	mkdir -p $(OUT_DIR)
	crystal build --release pinyin.cr -o $(OUT_DIR)/pinyin

run:
	$(OUT_DIR)/pinyin

clean:
	rm -rf  $(OUT_DIR) .crystal .deps libs
