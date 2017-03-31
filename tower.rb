class TowerOfHanoi

  def initialize(number_of_towers = 3)
    @towers = number_of_towers
    @current_state = []
    number_of_towers.times {@current_state.push(0)}
    @current_state[0] = number_of_towers
  end

  def play
    binding.pry
    quit = false

    #until quit? is true
    until quit do
      #welcome user and print out current board
      welcome
      render_board

      #prompt user for move
      puts "Please enter the peg you'd like to move a disc from and the peg you'd like to a move a disc to, separated by a comma"
      print "<<"
      input = gets.chomp
      if input == "quit" || input == "q"
        quit = true
      # add elsif to validate input (1...@number_of_towers).input.split(",").to_a
      else
        from_position = input[0].to_i
        to_position = input[-1].to_i
      end
      #if move is valid, move the disc and update the board

      #print current board

      #prompt user for mood
    end
  end

  def welcome
    puts "Welcome to Tower of Hanoi"
    puts "Instructions: "
    puts "Enter where you'd like to move from and to "
    puts "in the format '1,3'.  Enter 'q' to quit"
    puts "\n"
  end

  def render_board
    @current_state.each_with_index do |discs, peg|
      puts "Peg #{peg+1} has #{discs} discs."
    end
    puts "\n"
  end

end
