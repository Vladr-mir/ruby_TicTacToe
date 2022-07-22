# frozen_string_literal: false

# Module for grid functions
# You can find grid patterns or find
# the position of a value in a grid
module Grid
  GRID = [
    %w[1 2 3],
    %w[4 5 6],
    %w[7 8 9]
  ]

  def find_in_grid(value, grid)
    grid.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        return [row_index, column_index] if value == column
      end
    end
    Array.new(2)
  end

  def find_horizontal_pattern(grid)
    grid.each do |row|
      return row[0] if row.uniq.size <= 1 
    end
    nil
  end

  def reverse_grid(grid)
    aux = Array.new(grid.length) { Array.new() }
    for row_index in 0...grid[0].length
      grid.each { |row| aux[row_index].push row[row_index] }
    end
    aux
  end
end
