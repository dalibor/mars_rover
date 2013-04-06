module MarsRover
  class Navigation

    NORTH = 'N'
    EAST  = 'E'
    SOUTH = 'S'
    WEST  = 'W'
    DIRECTIONS = [NORTH, EAST, SOUTH, WEST]

    attr_accessor :position, :direction

    def initialize(position, direction)
      @position = position
      @direction = direction
    end

    def rotate_left
      change_direction(-1)
    end

    def rotate_right
      change_direction(1)
    end

    def move_forward
      case direction
      when NORTH
        position.north
      when EAST
        position.east
      when SOUTH
        position.south
      when WEST
        position.west
      end
    end

    private
    def change_direction(step)
      new_index = (DIRECTIONS.index(direction) + step) % DIRECTIONS.length
      self.direction = DIRECTIONS[new_index]
    end
  end
end
