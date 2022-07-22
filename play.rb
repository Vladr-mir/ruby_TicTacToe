# frozen_string_literal: false

require './tictactoe'

game = TicTacToe.new
until game.ended
  system('clear')
  puts "Player: #{game.player}\n\n"
  puts game.show_grid
  game.place_simbol
end

puts "The result is: #{game.winner}"
