require './player'
class Game
  def initialize
    @player1 = Player.new("KONSTANTIN")
    @player2 = Player.new("ALEX")
    @game_running = true
    @player = true
  end


  def play_game
    num1 = rand(1..100)
    num2 = rand(1..200)
    good_answer = (num1 + num2).to_i

    if @player
        puts "#{@player1.name}: what is #{num1} + #{num2} ?"
        answer = gets.chomp().to_i
        if answer != good_answer
          puts "#{@player1.name}: Seriously? NO!"
          @player1.lives -= 1
          if @player1.lives == 0
            puts "----GAME OVER----"
            @game_running = false
            return
          end
          puts "#{@player1.name}:  #{@player1.lives}/3 vs #{@player2.lives}/3"
          @player = false
        else
          @game_running = false
          puts "Your answer was #{answer}"
          puts "#{@player1.name} you WIN"
        end
    end

    if !@player
        puts "----NEW TURN----"
        puts "#{@player2.name}: what is #{num1} + #{num2} ?"
        answer = gets.chomp().to_i
        if answer != good_answer
          puts "#{@player2.name}: Seriously? NO!"
          @player2.lives -= 1
          if @player2.lives == 0
            puts "----GAME OVER----"
            @game_running = false
            return
          end
          puts "#{@player1.name}:  #{@player2.lives}/3 vs #{@player1.lives}/3"
          @player = true
        else
          @game_running = false
          puts "Your answer was #{answer}"
          puts "#{@player2.name} you WIN"
        end
    end
  end

  def run_game
    while @game_running
      play_game
    end
  end
end
