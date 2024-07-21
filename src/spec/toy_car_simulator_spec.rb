# spec/toy_car_simulator_spec.rb
require 'rspec'
require_relative '../src/toy_car_simulator'

RSpec.describe ToyCar do
  let(:car) { ToyCar.new }

  describe '#run' do
    it 'executes instructions and returns the correct output' do
      instructions = 'F3, R, F4, R, F2, F1, L, B1, F2, R, R, R, F1, R, F2, R, F4, F1'
      expected_output = '(5,7,U)*, (5,7,R), (7,7,R)*, (7,7,D), (7,5,D), (7,4,D), (7,4,R), (7,4,R)*, (9,4,R), (9,4,D), (9,4,L), (9,4,U), (9,5,U), (9,5,R), (11,5,R), (11,5,D), (11,1,D), (11,1,D)*'
      expect(car.run(instructions)).to eq(expected_output)
    end
  end

  describe '#valid_position?' do
    it 'returns true for valid positions within limits and without obstacles' do
      expect(car.send(:valid_position?, 5, 5)).to be true
      expect(car.send(:valid_position?, 1, 1)).to be true
    end

    it 'returns false for positions with obstacles or out of limites' do
      expect(car.send(:valid_position?, 4, 6)).to be false 
      expect(car.send(:valid_position?, 16, 5)).to be false 
    end
  end

  describe '#move' do
    it 'updates position correctly for valid moves' do
      car.send(:move, 3) 
      expect(car.x).to eq(5)
      expect(car.y).to eq(8)

      car.send(:turn_right)
      car.send(:move, 2) 
      expect(car.x).to eq(7)
      expect(car.y).to eq(8)
    end

    it 'sets crashed status when hitting an obstacle or moving out of the limits' do
      car.send(:move, 5)
      expect(car.send(:formatted_position)).to include('*')

      car.send(:turn_left)
      car.send(:move, 10)
      expect(car.send(:formatted_position)).to include('*')
    end
  end

  describe '#turn_left and #turn_right' do
    it 'changes direction correctly' do
      car.send(:turn_left)
      expect(car.direction).to eq('L')

      car.send(:turn_right)
      expect(car.direction).to eq('U')

      car.send(:turn_right)
      expect(car.direction).to eq('R')
    end
  end
end
