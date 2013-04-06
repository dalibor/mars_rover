require 'spec_helper'

describe MarsRover::Position do

  let(:position) { Position.new(1, 1) }

  it "can change position to north" do
    position.north
    position.x.should == 1
    position.y.should == 2
  end

  it "can change position to east" do
    position.east
    position.x.should == 2
    position.y.should == 1
  end

  it "can change position to south" do
    position.south
    position.x.should == 1
    position.y.should == 0
  end

  it "can change position to west" do
    position.west
    position.x.should == 0
    position.y.should == 1
  end

  it "can detect if position is inside a two dimensional grid" do
    min = Position.new(0, 0)
    max = Position.new(5, 5)

    Position.new(0, 0).inside?(min, max).should be_true
    Position.new(5, 5).inside?(min, max).should be_true
    Position.new(1, 1).inside?(min, max).should be_true

    Position.new(2, -1).inside?(min, max).should be_false
    Position.new(-1, 2).inside?(min, max).should be_false
    Position.new(5, 6).inside?(min, max).should be_false
    Position.new(6, 5).inside?(min, max).should be_false
  end
end
