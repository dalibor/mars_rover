require 'spec_helper'

describe MarsRover::CLI do
  it "displays rovers position when mission if successful" do
    output = FakeIO.each_input(["5 5", "1 2 N", "LMLMLMLMM",
      "3 3 E", "MMRMMRMRRM"]) { CLI.run }

    output.should == "\n1 3 N\n5 1 E\n"
  end

  it "validates input for plateau top right position" do
    output = FakeIO.each_input(["X 2"]) { CLI.run }

    output.should == "Invalid input for top right position of plateau.\n"
  end

  it "validates input for rover initial position" do
    output = FakeIO.each_input(["5 5", "X X 1"]) { CLI.run }

    output.should == "Invalid input for initial position of rover.\n"
  end

  it "validates input for rover navigation commands" do
    output = FakeIO.each_input(["5 5", "1 3 N", "X"]) { CLI.run }

    output.should == "Invalid input for navigation commands for rover.\n"
  end
end
