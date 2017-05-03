require "./spec_helper"

describe Pinyin do
  it "prints tone accent" do
  	Pinyin.say("中心", style: Pinyin::Tone).should eq [["zhōng"],["xīn"]]
  	Pinyin.say("中心", style: Pinyin::Tone, heteronym: true).should eq [["zhōng", "zhòng"],["xīn"]]
  end

  it "prints tone2 accent" do
  	Pinyin.say("中心", style: Pinyin::Tone2).should eq [["zho1ng"],["xi1n"]]
  	Pinyin.say("中心", style: Pinyin::Tone2, heteronym: true).should eq [["zho1ng", "zho4ng"],["xi1n"]]
  end

  it "catches missing hash key error and ignores it" do
    Pinyin.say("aaa", style: Pinyin::Tone).should eq [] of String
    Pinyin.say("中a中", style: Pinyin::Tone).should eq [["zhōng"],["zhōng"]]
    Pinyin.say("中a中", style: Pinyin::Tone, heteronym: true).should eq [["zhōng", "zhòng"],["zhōng", "zhòng"]]
  end
end
