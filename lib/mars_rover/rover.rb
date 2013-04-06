require 'forwardable'

module MarsRover
  class Rover

    class CommandNotFound < StandardError; end

    extend Forwardable
    def_delegators :@navigation, :position, :direction
    def_delegators :position, :inside?

    LEFT  = 'L'
    RIGHT = 'R'
    MOVE  = 'M'

    def initialize(navigation, plateau)
      @navigation = navigation
      @plateau = plateau
      @plateau.add_rover(self)
    end

    def navigate(commands)
      commands.split('').each do |command|
        case command
        when LEFT
          @navigation.rotate_left
        when RIGHT
          @navigation.rotate_right
        when MOVE
          @navigation.move_forward
        else
          raise CommandNotFound, "command not found: '#{command}'"
        end

        @plateau.check_for_failures!(self)
      end
    end

    def display_location
      "#{position.x} #{position.y} #{direction}"
    end

    def self.deploy(plateau, position, direction)
      navigation = Navigation.new(position, direction)
      new(navigation, plateau)
    end
  end
end
