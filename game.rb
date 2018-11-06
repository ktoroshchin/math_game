require './player'
class Game
  def initialize
    @player1 = Player.new("Konstantin")
    @player2 = Player.new("Alex")
    @game_running = true
    @player = true
  end


  def ask
    num1 = rand(1..100)
    num2 = rand(1..200)
    good_answer = (num1 + num2).to_i
    puts  good_answer

    if @player

        puts "What is #{num1} + #{num2} ?"
        answer = gets.chomp().to_i
        if answer != good_answer
          @player1.lives -= 1
          if @player1.lives == 0
            puts "You have 0 lives"
            puts "PLAYER1 You LOOOOSERRRR, PLAYER2 WINS"
            @game_running = false
            return
          end
          puts "number of lives left for PLAYER1 ---> #{@player1.lives}"
          @player = false
        else
          @game_running = false
          puts "Your answer was #{answer}"
          puts "PLAYER1 You WIN"
        end
    end

    if !@player

        puts "What is #{num1} + #{num2} ?"
        answer = gets.chomp().to_i
        if answer != good_answer
          @player2.lives -= 1
          if @player2.lives == 0
            puts "You have 0 lives"
            puts "PLAYER2 You LOOOOSERRRR, PLAYER1 WINS"
            @game_running = false
            return
          end
          puts "number of lives left for PLAYER2 ---> #{@player2.lives}"
          @player = true
        else
          @game_running = false
          puts "Your answer was #{answer}"
          puts "PLAYER2 You WIN"
        end
    end

  end

  def run
    while @game_running
      ask
    end
  end
end
