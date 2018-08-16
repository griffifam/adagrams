words_created = []
in_progress = true

while in_progress
  in_progress = false

def draw_letters()
  letters =
  ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "x", "y", "y", "z"]

  pool = letters.map do |element|
    element.upcase
  end

  pool = pool.shuffle

  hand_drawn = []

  10.times do |i|
    hand_drawn << pool[i]
  end

  return hand_drawn
end



def uses_available_letters?(input, letters_drawn_input)

  input_array = []
  input.length.times do |i|
    input_array << input[i]
  end

  testing_array = []
  editted_letters_drawn = letters_drawn_input

  input_array.length.times do |i|
    if editted_letters_drawn.include?(input_array[i])
      index_of_letter = editted_letters_drawn.index(input_array[i])
      editted_letters_drawn.delete_at(index_of_letter)

      testing_array << true
      puts "#{editted_letters_drawn}"
    else
      testing_array << false
      puts "#{editted_letters_drawn}"
    end
  end


#   word_hash = {}
#   if testing_array.all? == true
#     word_hash[:word] = input
#     word_hash[:score] = score_word(input)
#     words_created << word_hash
#   end
#
# puts "#{word_hash}"
# puts "#{words_created}"
   return testing_array.all?
end



def score_word(word)

  parsed_word = []
  word.length.times do |i|
    parsed_word << word[i].upcase
  end

  total = 0
  parsed_word.each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      value = 1
      total += value
    when "D", "G"
      value = 2
      total += value
    when "B", "C", "M", "P"
      value = 3
      total += value
    when "F", "H", "V", "W", "Y"
      value = 4
      total += value
    when "K"
      value = 5
      total += value
    when "J", "X"
      value = 8
      total += value
    when "Q", "Z"
      value = 10
      total += value
    end
  end
  if word.length >= 7
    total += 8
  end
  if word.length == 0
    total = 0
  end
  return total
end

def highest_score_from(words)

return winning_word
end
# letters_in_hand = draw_letters
# print "Here are your letters:\n#{letters_in_hand}\n"
# print users_hand

letters_taken = draw_letters
print letters_taken

print "What is your word creation: "
user_input = gets.chomp.upcase
strings_of_input = []
strings_of_input << user_input

x = uses_available_letters?(user_input, letters_taken)
puts "#{x}"

word_sum = score_word(user_input)
# print word_sum


puts "Would you like to draw again?"
close_program = gets.chomp

if close_program == "yes" || close_program == "YES" || close_program == "Yes" ||close_program == "y" || close_program == "Y"
  in_progress = true
else
  puts "The word with the highest score was #{key} with #{value} points."
  puts "Thanks for playing. Goodbye!"
  in_progress = false
end

end
