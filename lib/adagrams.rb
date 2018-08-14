
pool =
["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "x", "y", "y", "z"]

def draw_letters()
  pool =
  ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "x", "y", "y", "z"]
  pool = pool.shuffle

  hand_drawn = []

  10.times do |i|
    hand_drawn << pool[i]
  end

  return hand_drawn
end

def uses_available_letters(input, letters_drawn_input)
  input_array = []
  input.length.times do |i|
    input_array << input[i]
  end

  testing_array = []
  editted_letters_drawn = letters_drawn_input
  input_array.each do |letter|
    if editted_letters_drawn.include?(letter)
      editted_letters_drawn.delete(letter)
      # print "#{editted_letters_drawn}"
      testing_array << true
    else
      testing_array << false
    end
  end

  # puts testing_array
   puts testing_array.all?
end




# letters_in_hand = draw_letters
# print "Here are your letters:\n#{letters_in_hand}\n"
# print users_hand

letters_taken = draw_letters
print letters_taken

print "What is your word creation: "
user_input = gets.chomp

x = uses_available_letters(user_input, letters_taken)
puts "#{x}"
