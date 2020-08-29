require './player'

class Game

  def initialize
    # create 2 players
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player2, @player1]

    # rounds
    @round = 1
  end

  def question 
    @number1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].shuffle.first
    @number2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].shuffle.last
    @result = @number1 + @number2
  end

  def player_turn
    #define turn start with player 1 and chnage after each qestion
    @round += 1
    @players.rotate!
  end

  def display_question
    puts "#{@players[0].name}: What does #{@number1} plus #{@number2} equal?"
  end

  def prompt_answer
    @answer = gets.chomp().to_i
  end

  def verify_answer
    @result == @answer? (puts "YES! You are correct.") :( puts "Seriously? No!")
  end

  def game_over
    @players[0].isAlive? != @players[1].isAlive?
  end

  def winner
    if @players[0].isAlive?
      (puts "The winner is #{@players[0].name}") 
    else
    (puts "The winner is #{@players[1].name}") 
    end
  end


  def play
#loop for 1x player and continou if  the player lives > 0
puts
puts "============ Power minds Game =============="

puts
    until game_over do

      player_turn
      question
      # puts "============================================"
      display_question
      puts "============================================"
      prompt_answer
      # puts "============================================"
      verify_answer
      puts
      puts "============================================"
      @players[0].question_opportunity(@answer,@result)
      @players[0].lives
      @players[0].isAlive?

    end
    puts 
    puts "********************************"
    winner
    puts "********************************"

  end
end