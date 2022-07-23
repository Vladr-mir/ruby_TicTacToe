# frozen_string_literal: false

# Module for grid functions
# * Find horizontal patterns
# * Do a transpose of a grid
# * Find the diagonals of a grid
module Grid
  DIGITS_GRID = [
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

  def transpose(grid)
    aux = Array.new(grid.length) { [] }
    grid[0].each_index do |row_index|
      grid.each { |row| aux[row_index].push row[row_index] }
    end
    aux
  end

  def find_diagonals(grid)
    max = grid.length - 1
    aux = Array.new(2) { [] }
    grid.each_index do |i|
      aux[0].push grid[i][i]
      aux[1].push grid[i][max - i]
    end
    aux
  end
end
