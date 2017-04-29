require "./spec_helper"

describe Pinyin::CLI do
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
end
