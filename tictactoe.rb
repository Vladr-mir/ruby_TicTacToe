# frozen_string_literal: false

require './grid'

# Implementation of the `TicTacToe` game
class TicTacToe
  attr_reader :grid, :ended, :winner, :player

  include Grid

  def initialize
    @grid = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
    @player = 'x'
    @winner = nil
    @ended = false
  end

  def place_simbol(selection)
    return 'Not a valid Input' unless selection.to_i.between?(1, 9)

    select_value(selection)
    @winner = if tie?
                'tie'
              else
                find_winner
              end
    @ended = true unless @winner.nil?
  end

  def show_grid
    formatted = ''
    @grid.each.with_index do |row, row_index|
      formatted.concat format_row(row)
      formatted.concat "\n"
      formatted.concat "-------\n" unless row_index >= 2
    end
    formatted.concat "\n"
  end

  private

  def find_winner
    horizontal = find_horizontal_pattern(@grid)
    vertical = transpose(@grid)
    vertical = find_horizontal_pattern(vertical)
    diagonal = find_diagonals(@grid)
    diagonal = find_horizontal_pattern(diagonal)

    rules = [horizontal, vertical, diagonal]
    rules.each { |element| return element unless element.nil? }
    nil
  end

  def tie?
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        return false if value == DIGITS_GRID[row_index][value_index]
      end
    end
    true
  end

  def format_row(row)
    format = ''
    row.each.with_index do |element, index|
      if index >= 2
        format.concat(element.to_s)
      else
        format.concat("#{element}\s|")
      end
    end
    format
  end

  def select_value(selection)
    i, j = find_in_grid(selection, @grid)
    return if i.nil? || j.nil?

    @grid[i][j] = @player
    @player = if @player == 'x'
                'o'
              else
                'x'
              end
  end
end
