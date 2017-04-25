require "./spec_helper"

describe Pinyin do
  it "prints tone accent" do
  	Pinyin.say("中心", style: Pinyin::Tone).should eq [["zhōng"],["xīn"]]
  	Pinyin.say("中心", style: Pinyin::Tone, heteronym: true).should eq [["zhōng", "zhòng"],["xīn"]]
  end

  it "prints tone accent" do
  	# TODO
  	# Pinyin.say("中心", style: Pinyin::ToneNumber).should eq [["zho1ng"],["xi1n"]]
  	# Pinyin.say("中心", style: Pinyin::ToneNumber, heteronym: true).should eq [["zho1ng", "zho4ng"],["xi1n"]]
  end
end
