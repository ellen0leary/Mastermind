class Codemaster
  colours = ['red', 'blue', 'yellow', 'green', 'black', 'white']
  peg1 = rand(5)
  peg2 = rand(5)
  peg3 = rand(5)
  peg4 = rand(5)
  @@peg_array = Array[colours[peg1], colours[peg2], colours[peg3], colours[peg4]]
  puts @@peg_array

  def pegs
    @@peg_array
  end
end

class Codebreaker
  @@code = Codemaster.new
  @@turns = 0

  def check_pegs(array)
    codes = @@code.pegs
    if array == codes
      puts 'Correct Code'
      correct
    else
      places = 0
      [0, 1, 2, 3].each do |i|
        places += 1 if array[i] == codes[i]
      end
      colours = 0
      intersection = Array.new(0)
      [0, 1, 2, 3].each do |i|
        peg = array[0].to_s if array[i] != codes[i]
        intersection.push(peg)
      end
      similar_count = Hash.new(0)
      intersection.each { |i| similar_count[i] += 1 }
      similar_count.each { |i, j| colours += j }
      puts "#{places} pegs are in the right place"
      puts "#{colours-places} similar colours (not including pegs in right place)"
      turn
    end
  end

  def turn
    if @@turns < 10
      @@turns += 1
      puts 'Choose a colour for peg 1 (red, blue, yellow, green, black, white)'
      option1 = gets.chomp
      puts 'Choose a colour for peg 2'
      option2 = gets.chomp
      puts 'Choose a colour for peg 3'
      option3 = gets.chomp
      puts 'Choose a colour for peg 4'
      option4 = gets.chomp
      chosen_pegs = Array[option1.to_s, option2.to_s, option3.to_s, option4.to_s]
      puts chosen_pegs
      check_pegs(chosen_pegs)
    else
      puts "Code master has won. The pegs were #{@@code.pegs}"
    end
  end

  def correct
    puts "Congrats you won! The correct code was #{@@code.pegs}"
    puts 'Game over!'
  end
end

breaker = Codebreaker.new
breaker.turn
