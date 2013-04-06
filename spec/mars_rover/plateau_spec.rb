require 'spec_helper'

describe MarsRover::Plateau do

  let(:max_position) { Position.new(5, 5) }
  let(:plateau) { Plateau.new(max_position) }

  it "can add a rover" do
    rover = stub(:rover)
    plateau.add_rover(rover)
    plateau.rovers.should == [rover]
  end

  it "raises OutsideOfBoundary exception when rover is outside of boundaries" do
    rover = Rover.deploy(plateau, Position.new(6, 6), 'N')
    lambda { plateau.check_for_failures!(rover)
      }.should raise_exception(Plateau::OutsideOfBoundary)
  end

  it "raises CollisionError exception when 2 rovers are on the same position" do
    rover1 = Rover.deploy(plateau, Position.new(3, 3), 'N')
    rover2 = Rover.deploy(plateau, Position.new(3, 3), 'N')

    lambda { plateau.check_for_failures!(rover2)
      }.should raise_exception(Plateau::CollisionError)
  end
end
