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
    aux = false
    grid.each do |row|
      aux = row.uniq.size <= 1
      return aux if aux
    end
    aux
  end

  def find_vertical_pattern(grid); end
end
