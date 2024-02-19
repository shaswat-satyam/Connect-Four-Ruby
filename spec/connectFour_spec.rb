require 'connectFour'
describe ConnectFour do
  subject(:newGame) {described_class.new  }

  it 'can be initalized'do
    expect(newGame).not_to be_nil
  end

  describe '#isFull?' do 
    it 'check if the board is empty'do
      expect(newGame.isFull?).to be false
     end
    
    it 'ends the game if board is full' do
      7.times do |i|
        6.times{|j| newGame.newMove(j,0)}
      end
      expect(newGame.isFull?).to be true

    end
  end

   
  describe "#newMove" do
    it 'accepts input from player'do
      newGame.newMove(1,1)
    expect(newGame.board[1][0]).to eq(1)
    end
    it 'accepts two moves from player0'do
    newGame.newMove(1,0)
    newGame.newMove(1,0)
      expect(newGame.board[1][0]).to eq(0)
      expect(newGame.board[1][1]).to eq(0)
    end
    it'accepts two moves from player 1 and player 2'do
      newGame.newMove(1,0)
      newGame.newMove(1,1)
      expect(newGame.board[1][0]).to eq(0)
      expect(newGame.board[1][1]).to eq(1)
    end
    it 'give error when input is not valid ' do
    expect{newGame.newMove(9,0)}.to output(a_string_including("not valid")).to_stdout
    end
  end
  
  describe '#validMove?' do
    subject(:game){described_class.new}
    it 'rejects move when column is full 'do 
      7.times{game.newMove(0,0)}
      expect(game.validMove?(0)).to be false 
    end
    it 'reject move when column out of bound' do
      expect(game.validMove?(9)).to be false
    end
    it 'return true for a valid move ' do
    expect(game.validMove?(3)).to be true
    end
  end
  describe '#display'do
    subject(:newgame){described_class.new}
    it 'displays the board with the players input' do
    expect{newgame.display}.to output(a_string_including('O')).to_stdout
    end
    it 'displays the moves for player 0' do
      newgame.newMove(0,0)
      expect{newgame.display}.to output(a_string_including('0')).to_stdout
    end
    it 'displays the moves for player 1'do
      newgame.newMove(1,1)
      expect{newgame.display}.to output(a_string_including('1')).to_stdout
    end
    it 'display the moves for player 1 and 0' do
      newgame.newMove(0,0)     
      newgame.newMove(1,1)
    expect{newgame.display}.to output(a_string_including('1')).to_stdout
    expect{newgame.display}.to output(a_string_including('0')).to_stdout
    end
  end
  describe '#hasWon' do
    it 'checks if 0 has won' do
    newgame.newMove(0,0)
    newgame.newMove(0,1)
    newgame.newMove(0,2)
    newgame.newMove(0,3)
    expect(newgame.hasWon(0)).to be true
    end
    it 'checks for the winning condition  '
  end
  it 'declares who wins'
  it 'shows winning message to the winner' 
end
