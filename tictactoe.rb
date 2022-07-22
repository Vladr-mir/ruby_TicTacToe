# frozen_string_literal: false

require './grid'
require 'pry-byebug'

# Implementation of the `TicTacToe` game
class TicTacToe
  attr_reader :grid, :ended, :winner

  include Grid

  def initialize
    @grid = GRID
    @player = 'o'
    @winner = 'tie'
    @ended = false
  end

  def play
    selection = gets.chomp
    return 'Not a valid Input' unless selection.to_i.between?(1, 9)

    select_value(selection)
    show_current_state
    p find_horizontal_pattern(@grid)
  end

  def reset
    @grid = GRID
    @player = 'o'
    @winner = 'tie'
    @ended = false
  end

  def show_current_state
    show_grid
    puts "\n"
  end

  private

  def show_grid
    @grid.each.with_index do |row, row_index|
      puts format_row(row)
      puts '-------' unless row_index >= 2
    end
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
    @player = if @player == 'o'
                'x'
              else
                'o'
              end
  end
end

game = TicTacToe.new
game.show_current_state

game.play until game.ended

puts "The winner is #{game.winner}"
