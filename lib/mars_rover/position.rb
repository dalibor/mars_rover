module MarsRover
  class Position < Struct.new(:x, :y)

    def north
      self.y += 1
    end

    def east
      self.x += 1
    end

    def south
      self.y -= 1
    end

    def west
      self.x -= 1
    end

    def inside?(min, max)
      x >= min.x && y >= min.y && x <= max.x && y <= max.y
    end
  end
end
