[![Build Status](https://travis-ci.org/tmlee/crystal-pinyin.svg)](https://travis-ci.org/tmlee/crystal-pinyin)

# pinyin

Chinese Character Pinyin Conversion Tool written in Crystal Language

汉语拼音转换工具 - Crystal Language

## Installation

```
  git clone git@github.com:tmlee/crystal-pinyin.git
```

```
  cd /path/to/crystal-pinyin
  ./bin/pinyin 中国
  >> zhōng guó
```

TODO: Install as a Shard

## Usage

```
  ./bin/pinyin 中国
  >> zhōng guó
```

## Development

To Be Implemented
- [x] Executable Pinyin via command line
- [x] 0, 普通风格，不带声调（默认风格）。如： zhong guo
- [x] 3, 声母风格，只返回各个拼音的声母部分。如： zh g
- [ ] 4, 首字母风格，只返回拼音的首字母部分。如： z g
- [ ] 5, 韵母风格，只返回各个拼音的韵母部分，不带声调。如： ong uo
- [ ] 6, 韵母风格1，带声调，声调在韵母第一个字母上。如： ōng uó
- [ ] 7, 韵母风格2，带声调，声调在各个韵母之后，用数字 [1-4] 进行表示。如： o1ng uo2
- [ ] 9, 韵母风格3，带声调，声调在各个拼音之后，用数字 [1-4] 进行表示。如： ong1 uo2
- [ ] Refactor parsing code into functions
- [ ] Code Optimization
- [ ] Import/Sync 汉语字典
- [x] Command line error handling
- [x] Travis CI

## Contributing

1. Fork it ( https://github.com/[your-github-name]/pinyin/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[your-github-name]](https://github.com/[your-github-name])  - creator, maintainer
