require 'set'

class ToyCar
  def self.generate_obstacles(start_x, end_x, y)
    (start_x..end_x).map { |x| { x: x, y: y } }
  end

  DIRECTIONS = %w[U R D L]  # Up, Right, Down, Left
  GRID_SIZE = { x: 15, y: 10 }
  OBSTACLES = Set.new([
    { x: 4, y: 6 }, { x: 5, y: 12 },
    *generate_obstacles(3, 5, 8),
    *generate_obstacles(6, 8, 8),
    *generate_obstacles(2, 4, 10)
  ])

  attr_reader :x, :y, :direction

  def initialize
    @x, @y = 5, 5
    @direction = 'U'
    @crashed = false
  end

  def run(instructions)
    instructions.split(', ').map do |instruction|
      execute_instruction(instruction)
      formatted_position
    end.join(', ')
  end

  private

  def execute_instruction(instruction)
    command = instruction[0]
    value = instruction[1..].to_i
    case command
    when 'F'
      move(value)
    when 'B'
      move(-value)
    when 'L'
      turn_left
    when 'R'
      turn_right
    end
  end

  def move(steps)
    dx, dy = direction_vector
    steps.abs.times do
      next_x = @x + (dx * steps / steps.abs)
      next_y = @y + (dy * steps / steps.abs)

      if valid_position?(next_x, next_y)
        @x, @y = next_x, next_y
      else
        @crashed = true
        break
      end
    end
  end

  def direction_vector
    case @direction
    when 'U' then [0, 1]
    when 'R' then [1, 0]
    when 'D' then [0, -1]
    when 'L' then [-1, 0]
    end
  end

  def turn_left
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
  end

  def turn_right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
  end

  def valid_position?(x, y)
    within_bounds?(x, y) && !OBSTACLES.include?({ x: x, y: y })
  end

  def within_bounds?(x, y)
    x.between?(1, GRID_SIZE[:x]) && y.between?(1, GRID_SIZE[:y])
  end

  def formatted_position
    position = "(#{@x},#{@y},#{@direction})"
    if @crashed
      @crashed = false 
      position + '*'
    else
      position
    end
  end
end

instructions = 'F3, R, F4, R, F2, F1, L, B1, F2, R, R, R, F1, R, F2, R, F4, F1'
car = ToyCar.new
puts car.run(instructions)
