# spec/tictactoe_spec.rb
# frozen_string_literal: false

require './lib/tictactoe'

RSpec.describe TicTacToe do
  describe '#show_grid' do
    it 'returns the initial grid formatted' do
      tictactoe = TicTacToe.new
      formatted_grid = "1 |2 |3\n-------\n4 |5 |6\n-------\n7 |8 |9\n\n"
      expect(tictactoe.show_grid).to eql(formatted_grid)
    end

    it 'returns current grid formatted' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('2')
      formatted_grid = "1 |o |3\n-------\n4 |x |6\n-------\n7 |8 |9\n\n"
      expect(tictactoe.show_grid).to eql(formatted_grid)
    end
  end

  describe '#ended' do
    it 'returns false when game starts' do
      tictactoe = TicTacToe.new
      expect(tictactoe.ended).to eql(false)
    end

    it 'returns true when a player wins in a row' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('1')
      tictactoe.place_simbol('4')
      tictactoe.place_simbol('2')
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('3')

      expect(tictactoe.ended).to eql(true)
    end

    it 'returns true when a player wins in a column' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('1')
      tictactoe.place_simbol('2')
      tictactoe.place_simbol('4')
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('7')

      expect(tictactoe.ended).to eql(true)
    end

    it 'returns true when a player wins in a diagonal' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('1')
      tictactoe.place_simbol('2')
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('6')
      tictactoe.place_simbol('9')

      expect(tictactoe.ended).to eql(true)
    end

    it 'returns true if it\'s a tie' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('1')
      tictactoe.place_simbol('2')
      tictactoe.place_simbol('3')
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('4')
      tictactoe.place_simbol('6')
      tictactoe.place_simbol('8')
      tictactoe.place_simbol('7')
      tictactoe.place_simbol('9')

      expect(tictactoe.ended).to eql(true)
    end
  end

  describe '#winner' do
    it 'returns the correct winner' do
      tictactoe = TicTacToe.new
      tictactoe.place_simbol('1')
      tictactoe.place_simbol('4')
      tictactoe.place_simbol('2')
      tictactoe.place_simbol('5')
      tictactoe.place_simbol('3')

      # since the last place simbol call updates the player
      # the winner cannot be the current player
      expect(tictactoe.winner).to_not eql(tictactoe.player)
    end
  end
end
