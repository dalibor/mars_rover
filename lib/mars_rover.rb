require "mars_rover/version"

module MarsRover
  autoload :Plateau,    'mars_rover/plateau'
  autoload :Rover,      'mars_rover/rover'
  autoload :Navigation, 'mars_rover/navigation'
  autoload :Position,   'mars_rover/position'
  autoload :CLI,        'mars_rover/cli'

  def self.start
    CLI.run
  end
end
