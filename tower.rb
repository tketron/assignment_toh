class TowerOfHanoi

  def initialize(number_of_towers = 3)
    @towers = number_of_towers
    #store game board as a hash uising peg numbers as keys and arrays of the discs on each peg as the values
    @current_state = {}
    (1..number_of_towers).each { |peg| @current_state[peg] = [number_of_towers+1]}
    @current_state[1] = (1..number_of_towers).to_a.reverse.unshift(number_of_towers+1)
  end

  def play
    quit = false
    welcome

    #until quit? is true
    until quit do
      #welcome user and print out current board
      render_board

      #prompt user for move
      puts "Please enter your move"
      print "from peg,to peg << "
      input = gets.chomp
      if input == "quit" || input == "q"
        quit = true
      # add elsif to validate input (1...@number_of_towers).input.split(",").to_a
      else
        from_position = input[0].to_i
        to_position = input[-1].to_i
        if valid_move?(from_position, to_position)
          disc_size = remove_disc(from_position)
          add_disc(to_position, disc_size)
        else
          puts "*****************************\n
                Not a valid move, try again!\n
                ****************************"
        end
        if game_won?
          quit = true
          puts "Congratulations!  You won!"
        end
      end
    end
  end

  def welcome
    puts "Welcome to Tower of Hanoi"
    puts "Instructions: "
    puts "Enter where you'd like to move from and to "
    puts "in the format '1,3'.  Enter 'q' to quit\n\n"
  end

  def render_board
    @current_state.each do |peg, discs|
      puts "Peg #{peg} has #{discs} discs."
    end
    puts "\n"
  end

  def valid_move?(from_peg, to_peg)
    if @current_state[from_peg][-1] == @towers+1
      return false
    elsif @current_state[from_peg][-1] >= @current_state[to_peg][-1]
      return false
    else
      return true
    end
  end

  def add_disc(peg, disc_size)
    @current_state[peg] = @current_state[peg].push(disc_size)
  end

  def remove_disc(peg)
    if @current_state[peg].nil?
      return false
    else
      return @current_state[peg].pop
    end
  end

  #test if the game is won by checking if the final peg has all the discs
  def game_won?
    if @current_state[@towers].length == @towers+1
      return true
    else
      return false
    end
  end

end
