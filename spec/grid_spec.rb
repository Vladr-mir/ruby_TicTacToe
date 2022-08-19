# spec/grid_spec.rb
# frozen_string_literal: false

require './lib/grid'

class TestGrid
  include Grid
end

RSpec.describe Grid do
  describe '#find_in_grid' do
    it 'returns the position of a value in a bidimensional array' do
      arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      grid = TestGrid.new
      expect(grid.find_in_grid('5', arr)).to eql([1, 1])
    end

    it 'returns the position of a value in a bidimensional array' do
      arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      grid = TestGrid.new
      expect(grid.find_in_grid('9', arr)).to eql([2, 2])
    end

    it 'returns [nil, nil] if it doesn\'t find the element' do
      arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      grid = TestGrid.new
      expect(grid.find_in_grid('10', arr)).to eql([nil, nil])
    end

    it 'returns [nil, nil] if given an empty array' do
      arr = [[]]
      grid = TestGrid.new
      expect(grid.find_in_grid('1', arr)).to eql([nil, nil])
    end
  end

  describe '#find_horizontal_pattern' do
    it 'returns nil when it doesn\'t find a pattern' do
      arr = [%w[1 2 3]]
      grid = TestGrid.new
      expect(grid.find_horizontal_pattern(arr)).to be_nil
    end

    it 'returns nil given an empty array' do
      arr = [[]]
      grid = TestGrid.new
      expect(grid.find_horizontal_pattern(arr)).to be_nil
    end

    it 'returns the repeating value when it finds a pattern' do
      arr = [%w[1 2 3], %w[4 4 4]]
      grid = TestGrid.new
      expect(grid.find_horizontal_pattern(arr)).to eql('4')
    end

    it 'returns the repeating value when it finds a pattern' do
      arr = [%w[1 2 3], %w[x x x]]
      grid = TestGrid.new
      expect(grid.find_horizontal_pattern(arr)).to eql('x')
    end
  end

  describe '#transpose' do
    it 'returns the transpose of an array' do
      arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      expected_result = [%w[1 4 7], %w[2 5 8], %w[3 6 9]]
      grid = TestGrid.new
      expect(grid.transpose(arr)).to eql(expected_result)
    end

    it 'returns the transpose of an array' do
      arr = [%w[9 8 7], %w[6 5 4], %w[3 2 1]]
      expected_result = [%w[9 6 3], %w[8 5 2], %w[7 4 1]]
      grid = TestGrid.new
      expect(grid.transpose(arr)).to eql(expected_result)
    end

    it 'returns the transpose of an array of emtpy arrays' do
      arr = [[], [], []]
      grid = TestGrid.new
      expect(grid.transpose(arr)).to eql(arr)
    end

    it 'returns the array when given an unidimensional array' do
      arr = []
      grid = TestGrid.new
      expect(grid.transpose(arr)).to eql(arr)
    end
  end

  describe '#find_diagonals' do
    it 'returns both diagonals' do
      arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
      expected_result = [%w[1 5 9], %w[3 5 7]]
      grid = TestGrid.new
      expect(grid.find_diagonals(arr)).to eql(expected_result)
    end
  end
end
