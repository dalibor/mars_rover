require 'spec_helper'

describe MarsRover::Rover do

  describe "#navigate" do
    let(:navigation) { stub(:navigation) }
    let(:plateau) { stub(:plateau).as_null_object }
    let(:rover) { Rover.new(navigation, plateau) }

    it "understands L command" do
      navigation.should_receive(:rotate_left)
      rover.navigate("L")
    end

    it "understands R command" do
      navigation.should_receive(:rotate_right)
      rover.navigate("R")
    end

    it "understand M command" do
      navigation.should_receive(:move_forward)
      rover.navigate("M")
    end

    it "raises CommandNotFound exception when invalid command is sent" do
      navigation = stub(:navigation).as_null_object
      rover = Rover.new(navigation, plateau)

      lambda { rover.navigate('E')
        }.should raise_exception(Rover::CommandNotFound)
      lambda { rover.navigate(' ')
        }.should raise_exception(Rover::CommandNotFound)
      lambda { rover.navigate('LLE')
        }.should raise_exception(Rover::CommandNotFound)
    end
  end

  describe "#display_location" do
    let(:position) { Position.new(1, 5) }
    let(:navigation) { stub(:navigation, position: position, direction: 'N' ) }
    let(:plateau) { stub(:plateau).as_null_object }
    let(:rover) { Rover.new(navigation, plateau) }

    it "can return display_location" do
      rover.display_location.should == "1 5 N"
    end
  end

  describe '.deploy' do
    let(:max_position) { Position.new(5, 5) }
    let(:plateau) { Plateau.new(max_position) }

    it "can deploy rover to plateau" do
      position = Position.new(1, 2)
      rover = Rover.deploy(plateau, position, 'N')
      plateau.rovers.should == [rover]
    end

    it "can navigate left and forward after deploy" do
      position = Position.new(1, 2)
      rover = Rover.deploy(plateau, position, 'N')
      rover.navigate('LMLMLMLMM')
      rover.position.should == Position.new(1, 3)
      rover.direction.should == 'N'
    end

    it "can navigate right and forward after deploy" do
      position = Position.new(3, 3)
      rover = Rover.deploy(plateau, position, 'E')
      rover.navigate('MMRMMRMRRM')
      rover.position.should == Position.new(5, 1)
      rover.direction.should == 'E'
    end
  end
end
