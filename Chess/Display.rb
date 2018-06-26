require 'colorize'
require_relative 'Board'
require_relative 'Cursor'

class Display
  
  attr_reader :board
  
  def initialize
    @board = Board.new
    # @cursor = Cursor.new([0,0], board)
  end 
  
  
  
  def render

    while true 
      row = 0
      while row < 8
        col = 0
        while col < 8
          if @board.grid[row][col].nil?
            p "__".colorize(:green)
          else 
            piece = @board.grid[row][col]
             p piece.inspect
          end 
          col += 1
        end 
        row += 1
      end 
      input = gets.chomp
    end 
     
  end
end


 