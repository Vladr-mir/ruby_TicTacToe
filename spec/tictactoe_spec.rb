# spec/tictactoe_spec.rb
# frozen_string_literal: false

require './lib/tictactoe'

RSpec.describe TicTacToe do
  describe '#show_grid' do
    it '`puts` the initial grid formatted' do
      tictactoe = TicTacToe.new
      formatted_grid = "1 |2 |3\n-------\n4 |5 |6\n-------\n7 |8 |9\n\n"
      expect(tictactoe.show_grid).to eql(formatted_grid)
    end

    it '`puts` current grid formatted' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('2')
      formatted_grid = "1 |o |3\n-------\n4 |x |6\n-------\n7 |8 |9\n\n"
      expect(tictactoe.show_grid).to eql(formatted_grid)
    end
  end
end
