require_relative 'Piece'

class Board 
  attr_reader :grid

  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    row = 0
    while row < 2
      column = 0
      while column < 8
        @grid[row][column] = Piece.new
        column += 1
      end
      row += 1 
    end 
    
    row = 6
    while row < 8
      column = 0
      while column < 8
        @grid[row][column] = Piece.new
        column += 1
      end
      row += 1 
    end 
  end 
  
  def move_piece(start_pos,end_pos)
    if @grid[start_pos[0]][start_pos[1]].nil?
      raise 'no piece here'
    elsif (0..8).include?(end_pos[0]) && (0..8).include?(end_pos[1]) == false
      raise "Not a valid location."
    else
      @grid[end_pos[0]][end_pos[1]] = @grid[start_pos[0]][start_pos[1]]
      @grid[start_pos[0]][start_pos[1]]= nil
    end 
  end
  
  
  def valid_pos?(end_pos)
   (0..8).include?(end_pos[0]) && (0..8).include?(end_pos[1])
  end 
  
end 

