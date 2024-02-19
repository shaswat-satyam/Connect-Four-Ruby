
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
    
    @board.first.length.times do |j|

      @board.length.times do |i|
        ele = @board[i][@board.first.length - 1- j]
    if ele.nil?
        print "O  "
      else
          if ele == 0
            print "\u{1f534} "
        else
            print "\u{1f7e2} "
          end
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
  4.times do |i|
    @board[0].length.times do |j|
        puts i.to_s + " " + j.to_s
      return true if 4.times.all? {|k| @board[i+k][j+k] == player or @board[i-k][j-k] == player or @board[i+k][j-k] == player or @board[i-k][j+k] == player} 
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
    loop do
      system("cls") || system("clear")
      display
      puts "Player "+ player.to_s + " Enter your Move (0-5)"
      input = gets.chomp.to_i
      newMove(input,player)
      break if hasWon(player)
      player = (1+player)%2
    end
    system('clear')
    display
  puts "Player " + player.to_s+ " has won!"
  end
end


game1 = ConnectFour.new
game1.game
