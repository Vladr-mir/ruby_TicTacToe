# frozen_string_literal: false

require './tictactoe'

game = TicTacToe.new
until game.ended
  system('clear')
  puts "Player: #{game.player}\n\n"
  puts game.show_grid
  selection = gets.chomp
  game.place_simbol(selection)
end

puts game.show_grid
puts "The result is: #{game.winner}"
