# # THIS PROGRAM WE WROTE PASSES 16/16 OF THE TESTS BUT DOES NOT FUNCTION PROPERLY IN THE TERMINAL. IF YOU UNCOMMENT LINE 61, THIS GAME RUNS PROPERLY IN THE TERMINAL BUT ONLY PASSES 15/16 TESTS.
#
# @words_created = []
# @final_winner = []
#
# @all_points = []
# in_progress = true
#
#
# while in_progress
#   in_progress = false
#
#   def draw_letters()
#     letters =
#     ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "f", "f", "g", "g", "g", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m", "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t", "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "x", "y", "y", "z"]
#
#     pool = letters.map do |element|
#       element.upcase
#     end
#
#     pool = pool.shuffle
#
#     hand_drawn = []
#
#     10.times do |i|
#       hand_drawn << pool[i]
#     end
#
#     return hand_drawn
#   end
#
#
#   def uses_available_letters?(input, letters_drawn_input)
#     words_created = []
#
#     input_array = []
#     input.length.times do |i|
#       input_array << input[i]
#     end
#
#     testing_array = []
#     editted_letters_drawn = letters_drawn_input
#
#     input_array.length.times do |i|
#       if editted_letters_drawn.include?(input_array[i])
#         index_of_letter = editted_letters_drawn.index(input_array[i])
#         editted_letters_drawn.delete_at(index_of_letter)
#
#         testing_array << true
#
#       else
#
#         testing_array << false
#       end
#
#     end
#
#
#
#     if testing_array.all?
#       # @words_created << input
#       return true
#     else
#       return false
#     end
#
#
#   end
#
#
#   def score_word(word)
#
#     parsed_word = []
#     word.length.times do |i|
#       parsed_word << word[i].upcase
#     end
#
#     total = 0
#     parsed_word.each do |letter|
#       case letter
#       when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
#         value = 1
#         total += value
#       when "D", "G"
#         value = 2
#         total += value
#       when "B", "C", "M", "P"
#         value = 3
#         total += value
#       when "F", "H", "V", "W", "Y"
#         value = 4
#         total += value
#       when "K"
#         value = 5
#         total += value
#       when "J", "X"
#         value = 8
#         total += value
#       when "Q", "Z"
#         value = 10
#         total += value
#       end
#     end
#     if word.length >= 7
#       total += 8
#     end
#     if word.length == 0
#       total = 0
#     end
#     return total
#   end
#
#
#   def highest_score_from_words(words)
#
#     winning_words = []
#     length_of_winning_word = []
#     points_of_all_words_entered = []
#
#
#     indexes_of_max_point_words = []
#     final_winner_hash = {}
#
#     words.each do |x|
#       score = score_word(x)
#       points_of_all_words_entered << score
#     end
#
#     max_point_earned = points_of_all_words_entered.max
#
#     words.each do |x|
#       word_score = score_word(x)
#
#       if word_score == max_point_earned
#         indexes_of_max_point_words << words.find_index(x)
#       end
#
#     end
#
#     indexes_of_max_point_words.each do |y|
#       winning_words << words[y]
#     end
#
#     winning_words.each do |z|
#       length_of_winning_word << z.length
#     end
#
#     length_of_shortest_winning_word = length_of_winning_word.min
#     all_winning_words_of_shortest_length = []
#     number_of_winning_words_of_min_length = 0
#
#     winning_words.each do |x|
#       if x.length == length_of_shortest_winning_word
#         number_of_winning_words_of_min_length += 1
#         all_winning_words_of_shortest_length << x
#       end
#     end
#
#
#     length_of_winning_word.length.times do |i|
#       if length_of_winning_word[i] == 10
#
#         final_winner_hash[:word] = winning_words[i]
#         final_winner_hash[:score] = score_word(winning_words[i])
#         break
#       else
#         if number_of_winning_words_of_min_length == 1
#
#           final_winner_hash[:word] = all_winning_words_of_shortest_length
#           final_winner_hash[:score] = score_word(all_winning_words_of_shortest_length[0])
#         else
#
#           final_winner_hash[:word] = all_winning_words_of_shortest_length[0]
#           final_winner_hash[:score] = score_word(all_winning_words_of_shortest_length[0])
#         end
#       end
#
#     end
#
#
#     return final_winner_hash
#   end
#
#   puts "Welcome to Adagram"
#
#   words_created = []
#   hash_for_word = {}
#
#   letters_taken = draw_letters
#   puts "These are your available letters:"
#   puts "#{letters_taken}"
#
#   puts "What is your word creation? "
#   user_input = gets.chomp.upcase
#   strings_of_input = []
#   strings_of_input << user_input
#
#   x = uses_available_letters?(user_input, letters_taken)
#
#
#   word_sum = score_word(user_input)
#
#   puts "Would you like to draw again?"
#   close_program = gets.chomp
#
#   if close_program == "yes" || close_program == "YES" || close_program == "Yes" ||close_program == "y" || close_program == "Y"
#     in_progress = true
#   else
#
#     puts "These are all the words created: #{@words_created}"
#
#
#     puts "This is the final winner: #{highest_score_from_words(@words_created)}"
#     puts "Thanks for playing. Goodbye!"
#     in_progress = false
#   end
#
# end

def draw_letters
  all_letters = [
    ["A","A","A","A","A","A","A","A","A"],
    ["N","N","N","N","N","N"],
    ["B","B"],
    ["O","O","O","O","O","O","O","O"],
    ["C","C"],
    ["P","P"],
    ["D","D","D","D"],
    ["Q"],
    ["E","E","E","E","E","E","E","E","E","E","E","E"],
    ["R","R","R","R","R","R"],
    ["F", "F"],
    ["S","S","S","S"],
    ["G","G","G"],
    ["T","T","T","T","T","T"],
    ["H","H"],
    ["U","U","U","U"],
    ["I","I","I","I","I","I","I","I","I"],
    ["V", "V"],
    ["J"],
    ["W","W"],
    ["K"],
    ["X"],
    ["L","L","L","L"],
    ["Y","Y"],
    ["M","M"],
    ["Z"]
  ].flatten

  letters_in_hand = all_letters.shuffle[0..9]

  return letters_in_hand
end

def uses_available_letters?(input, letters_in_hand)
  hash_hand = Hash.new

  #Store letters in hand in hash
  letters_in_hand.each do |letter|
    if hash_hand[letter]
      hash_hand[letter] += 1
    else
      hash_hand[letter] = 1
    end
  end

  i = 0
  while i < input.length
    input_letter = input[i]
    if (!hash_hand[input_letter])
      return false
    end
    if hash_hand[input_letter]
      if hash_hand[input_letter] == 0
        return false
      end
      if hash_hand[input_letter] > 0
        hash_hand[input_letter] -= 1
      end
    end
    i += 1
  end
  return true
end

def score_word(word)
  points = 0
  word = word.upcase.split("")

  if word.length >= 7 && word.length <= 10
    points += 8
  end

  word.each do |letter|
    case letter
    when "A","E","I","O","U","L","N","R","S","T"
      points += 1
    when "D","G"
      points += 2
    when "B","C","M","P"
      points += 3
    when "F","H","V","W","Y"
      points += 4
    when "K"
      points += 5
    when "J","X"
      points += 8
    when "Q","Z"
      points += 10
    end
  end
  return points
end

def highest_score_from(words)
  words = words.map { |word| word.upcase }
  winning_word_hash = Hash.new
  max_score = 0

  i = 0
  while i < words.length
    if max_score < score_word(words[i])
      max_score = score_word(words[i])
      winning_word_hash[:word] = words[i]
      winning_word_hash[:score] = max_score
    end
    if max_score == score_word(words[i])
      if words[i].length == 10 && winning_word_hash[:word].length != 10
        winning_word_hash[:word] = words[i]
        return winning_word_hash
      end
      if winning_word_hash[:word].length == 10 && words[i].length != 10
        return winning_word_hash
      end
      if winning_word_hash[:word].length > words[i].length
        winning_word_hash[:word] = words[i]
      end
    end
    i += 1
  end
  return winning_word_hash
end
