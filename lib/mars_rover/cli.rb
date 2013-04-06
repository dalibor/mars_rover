module MarsRover
  class CLI

    PLATEAU_INPUT_REG_EXP  = /^(\d) (\d)$/
    ROVER_INPUT_REG_EXP    = /^(\d) (\d) ([NESW])$/
    ROVER_COMMANDS_REG_EXP = /^[LRM]+$/

    PLATEAU_INPUT_ERROR  = 'Invalid input for top right position of plateau.'
    ROVER_INPUT_ERROR    = 'Invalid input for initial position of rover.'
    ROVER_COMMANDS_ERROR = 'Invalid input for navigation commands for rover.'

    def initialize
      register_sigint_trap
      start_running
    end

    def run
      create_plateau
      while is_running?
        launch_rover
      end
    end

    def self.run
      new.run
    end

    private
    def register_sigint_trap
      trap("SIGINT") do
        display_rover_positions
        exit
      end
    end

    def display_rover_positions
      if defined?(@plateau)
        print_output('')
        @plateau.rovers.each do |rover|
          print_output("#{rover.display_location}")
        end
      end
    end

    def create_plateau
      validate_input(PLATEAU_INPUT_REG_EXP, PLATEAU_INPUT_ERROR) do |input|
        end_position = Position.new(input[1].to_i, input[2].to_i)
        @plateau = Plateau.new(end_position)
      end
    end

    def launch_rover
      validate_input(ROVER_INPUT_REG_EXP, ROVER_INPUT_ERROR) do |input|
        position = Position.new(input[1].to_i, input[2].to_i)
        rover = Rover.deploy(@plateau, position, input[3])

        navigate_rover(rover)
      end
    end

    def navigate_rover(rover)
      validate_input(ROVER_COMMANDS_REG_EXP, ROVER_COMMANDS_ERROR) do |input|
        rover.navigate(input[0])
      end
    end

    def validate_input(regexp, error_message)
      input = read_input

      if input.empty?
        stop_running
        display_rover_positions
      else
        matcher = input.match(regexp)
        if matcher
          yield(matcher)
        else
          stop_running
          print_output(error_message)
        end
      end
    end

    def print_output(string)
      $stdout.puts string
    end

    def read_input
      $stdin.gets.chomp.strip
    end

    def is_running?
      @running
    end

    def start_running
      @running = true
    end

    def stop_running
      @running = false
    end
  end
end
