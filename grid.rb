# frozen_string_literal: false

# Module for grid functions
module Grid
  GRID = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9']
  ]

  def find_in_grid(value, grid)
    grid.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        return [row_index, column_index] if value == column
      end
    end
    Array.new(2)
  end
end
