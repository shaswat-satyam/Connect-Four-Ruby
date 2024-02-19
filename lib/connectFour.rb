class ConnectFour
  attr_accessor :board, :top
  def initialize()
    @board = Array.new(6){Array.new(7)}
    @top = Array.new(7){0}
  end

  def display
    @board.each do |rows| 
      rows.each{|cell| print cell}
      puts
     end
   end
  
  def isFull?
    @board.flatten.all?{|cell| !cell.nil?}
  end

  def validMove?(col)
    -1 < col and col < 8 and top[col] < 7
  end
  def newMove(col,player)
    if(!validMove?(col))
      puts "You entered "+col.to_s+" which is not valid!"
      return
    end
    @board[col][top[col]] = player
    top[col] += 1
  end

  def display
    6.times do |i|
      7.times do |j|
        if board[5-i][j].nil?
          print 'O' 
        else 
          print board[5-i][j]
        end
      end
      puts
    end
  end

  def hasWon(player)
    verticalWin(player)|horizontalWin(player)|diagonalWin(player)
  end

  def verticalWin(player)
    (3)
  end
  
end

