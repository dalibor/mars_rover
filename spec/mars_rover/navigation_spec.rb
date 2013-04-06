require 'spec_helper'

describe MarsRover::Navigation do
  let(:position) { Position.new(3, 3) }
  let(:navigation) { Navigation.new(position, 'N') }

  describe "#rotate_left" do
    it "can rotate left for 90 degrees" do
      navigation.rotate_left
      navigation.direction.should == 'W'
    end

    it "can rotate left for 180 degrees" do
      2.times { navigation.rotate_left }
      navigation.direction.should == 'S'
    end

    it "can rotate left for 270 degrees" do
      3.times { navigation.rotate_left }
      navigation.direction.should == 'E'
    end

    it "can rotate left for 360 degrees" do
      4.times { navigation.rotate_left }
      navigation.direction.should == 'N'
    end
  end

  describe "#rotate_right" do
    it "can rotate right for 90 degrees" do
      navigation.rotate_right
      navigation.direction.should == 'E'
    end

    it "can rotate right for 180 degrees" do
      2.times { navigation.rotate_right }
      navigation.direction.should == 'S'
    end

    it "can rotate right for 270 degrees" do
      3.times { navigation.rotate_right }
      navigation.direction.should == 'W'
    end

    it "can rotate right for 360 degrees" do
      4.times { navigation.rotate_right }
      navigation.direction.should == 'N'
    end
  end

  describe "#move_forward" do
    it "can move forward once" do
      navigation.move_forward
      navigation.position.should == Position.new(3, 4)
    end

    it "can move forward twice" do
      2.times { navigation.move_forward }
      navigation.position.should == Position.new(3, 5)
    end
  end
end
