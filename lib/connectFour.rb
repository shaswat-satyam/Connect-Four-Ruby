class ConnectFour
  attr_accessor :board, :top

  def initialize
    @board = Array.new(6) { Array.new(7) }
    @top = Array.new(7) { 0 }
  end

  def display
    @board.each do |rows|
      rows.each { |cell| print cell }
      puts
    end
  end

  def isFull?
    @board.flatten.all? { |cell| !cell.nil? }
  end

  def validMove?(col)
    return false unless -1 < col and col < 6
    return false unless top[col] < 7

    true
  end

  def newMove(col, player)
    unless validMove?(col)
      puts 'You entered ' + col.to_s + ' which is not valid!'
      return
    end
    @board[col][top[col]] = player
    top[col] += 1
  end

  def display
    @board.first.length.times do |j|
      @board.length.times do |i|
        ele = @board[i][@board.first.length - 1 - j]
        if ele.nil?
          print 'O  '
        elsif ele == 0
          print "\u{1f534} "
        else
          print "\u{1f7e2} "
        end
      end
      puts
    end
  end

  def hasWon(player)
    verticalWin(player) | horizontalWin(player) | diagonalWin(player)
  end

  def verticalWin(player)
    @board.any? do |row|
      row.each_slice(4).to_a.any? { |sub| sub.all? { |ele| ele == player } }
    end
  end

  def diagonalWin(player)
    3.times do |i|
      4.times do |j|
        return true if [@board[0 + i][3 - j], @board[1 + i][4 - j], @board[2 + i][5 - j],
                        @board[3 + i][6 - j]].all? do |ele|
                         ele == player
                       end
        return true if [@board[5 - j][3 - i], @board[4 - j][4 - i], @board[3 - j][5 - i],
                        @board[2 - j][6 - i]].all? do |ele|
                         ele == player
                       end
      end
    end
    false
  end

  def horizontalWin(player)
    @board.transpose.any? do |row|
      row.each_slice(4).to_a.any? { |sub| sub.all? { |ele| ele == player } }
    end
  end

  def game
    player = 0
    loop do
      system('cls') || system('clear')
      display
      puts 'Player ' + player.to_s + ' Enter your Move (0-5)'
      input = gets.chomp.to_i
      newMove(input, player)
      break if hasWon(player)

      player = (1 + player) % 2
    end
    system('clear')
    display
    puts 'Player ' + player.to_s + ' has won!'
  end
end

game1 = ConnectFour.new
game1.game
