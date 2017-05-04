require "./spec_helper"

describe Pinyin::CLI do
  it "prints normal accent" do
    Process.run("./bin/pinyin", ["中心", "-s", "NORMAL"]) do |cmd|
     cmd.output.gets_to_end.should eq "zhong xin\n"
    end

    Process.run("./bin/pinyin", ["中心", "-s", "NORMAL", "-h"]) do |cmd|
     cmd.output.gets_to_end.should eq "zhong,zhong xin\n"
    end
  end

  it "prints tone accent" do
    Process.run("./bin/pinyin", ["中心"]) do |cmd|
     cmd.output.gets_to_end.should eq "zhōng xīn\n"
    end

    Process.run("./bin/pinyin", ["中心", "-h"]) do |cmd|
     cmd.output.gets_to_end.should eq "zhōng,zhòng xīn\n"
    end
  end

  it "prints tone2 accent" do
    Process.run("./bin/pinyin", ["中心", "-s", "TONE2"]) do |cmd|
     cmd.output.gets_to_end.should eq "zho1ng xi1n\n"
    end

    Process.run("./bin/pinyin", ["中心", "-s", "TONE2", "-h"]) do |cmd|
     cmd.output.gets_to_end.should eq "zho1ng,zho4ng xi1n\n"
    end
  end

  it "prints initials accent" do
    Process.run("./bin/pinyin", ["中心", "-s", "INITIALS"]) do |cmd|
     cmd.output.gets_to_end.should eq "zh x\n"
    end

    Process.run("./bin/pinyin", ["中心", "-s", "INITIALS", "-h"]) do |cmd|
     cmd.output.gets_to_end.should eq "zh,zh x\n"
    end
  end

  it "ignores characters that's not in the dictionary" do
    Process.run("./bin/pinyin", ["aaa", "-s", "TONE2"]) do |cmd|
     cmd.output.gets_to_end.should eq "\n"
    end

    Process.run("./bin/pinyin", ["中a中"]) do |cmd|
     cmd.output.gets_to_end.should eq "zhōng zhōng\n"
    end

    Process.run("./bin/pinyin", ["中a中", "-h"]) do |cmd|
     cmd.output.gets_to_end.should eq "zhōng,zhòng zhōng,zhòng\n"
    end
  end

  it "handles invalid option flags" do
    Process.run("./bin/pinyin", ["中心", "-invalid"]) do |cmd|
     cmd.output.gets_to_end.should contain "Invalid option: -invalid"
    end
  end
end
