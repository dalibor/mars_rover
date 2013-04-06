module MarsRover
  class Plateau

    class OutsideOfBoundary < StandardError; end
    class CollisionError < StandardError; end

    def initialize(max_position)
      @min_position = Position.new(0, 0)
      @max_position = max_position
      @rovers = []
    end

    def add_rover(rover)
      @rovers << rover
    end

    def rovers
      @rovers
    end

    def check_for_failures!(rover)
      raise OutsideOfBoundary, "outside of plateau boundary" if outside?(rover)
      raise CollisionError, "collision with another rover" if collide?(rover)
    end

    private
    def outside?(rover)
      !rover.inside?(@min_position, @max_position)
    end

    def collide?(rover)
      other_rovers = @rovers - [rover]
      other_rovers.any? { |other| rover.position == other.position }
    end
  end
end
