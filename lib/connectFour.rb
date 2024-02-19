
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
    @board.any? do |row|
      row.each_slice(4).to_a.any?{|sub| sub.all?{|ele| ele == player}}
    end
  end


  def diagonalWin(player)
  @board.length.times do |i|
    @board[0].length.times do |j|
      4.times.all? {|k| @board[i+k][j+k] == player or @board[i-k][j-k] == player or @board[i+k][j-k] == player or @board[i-k][j+k] == player} 
    end
  end
  false
end

  def horizontalWin(player)
    @board.transpose.any? do |row|
      row.each_slice(4).to_a.any?{|sub| sub.all?{|ele| ele == player}}
    end
  end  

  def game
    player = 0
    until hasWon(player)
      display
      puts player.to_s + " Enter your Move" 
      input = gets.chomp.to_i
      newMove(input,player)
      player = (1+player)%2
    end
    player = (player + 1)%2
  puts "Player " + player.to_s+ " has won!"
  end
end


game1 = ConnectFour.new
game1.game
