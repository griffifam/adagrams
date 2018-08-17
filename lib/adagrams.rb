# THIS PROGRAM WE WROTE PASSES 16/16 OF THE TESTS BUT DOES NOT FUNCTION PROPERLY IN THE TERMINAL. IF YOU UNCOMMENT LINE 61, THIS GAME RUNS PROPERLY IN THE TERMINAL BUT ONLY PASSES 15/16 TESTS.

@words_created = []
@final_winner = []

@all_points = []
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
    words_created = []

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

      else

        testing_array << false
      end

    end



    if testing_array.all?
      # @words_created << input
      return true
    else
      return false
    end


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


  def highest_score_from_words(words)

    winning_words = []
    length_of_winning_word = []
    points_of_all_words_entered = []


    indexes_of_max_point_words = []
    final_winner_hash = {}

    words.each do |x|
      score = score_word(x)
      points_of_all_words_entered << score
    end

    max_point_earned = points_of_all_words_entered.max

    words.each do |x|
      word_score = score_word(x)

      if word_score == max_point_earned
        indexes_of_max_point_words << words.find_index(x)
      end

    end

    indexes_of_max_point_words.each do |y|
      winning_words << words[y]
    end

    winning_words.each do |z|
      length_of_winning_word << z.length
    end

    length_of_shortest_winning_word = length_of_winning_word.min
    all_winning_words_of_shortest_length = []
    number_of_winning_words_of_min_length = 0

    winning_words.each do |x|
      if x.length == length_of_shortest_winning_word
        number_of_winning_words_of_min_length += 1
        all_winning_words_of_shortest_length << x
      end
    end


    length_of_winning_word.length.times do |i|
      if length_of_winning_word[i] == 10

        final_winner_hash[:word] = winning_words[i]
        final_winner_hash[:score] = score_word(winning_words[i])
        break
      else
        if number_of_winning_words_of_min_length == 1

          final_winner_hash[:word] = all_winning_words_of_shortest_length
          final_winner_hash[:score] = score_word(all_winning_words_of_shortest_length[0])
        else

          final_winner_hash[:word] = all_winning_words_of_shortest_length[0]
          final_winner_hash[:score] = score_word(all_winning_words_of_shortest_length[0])
        end
      end

    end


    return final_winner_hash
  end

  puts "Welcome to Adagram"

  words_created = []
  hash_for_word = {}

  letters_taken = draw_letters
  puts "These are your available letters:"
  puts "#{letters_taken}"

  puts "What is your word creation? "
  user_input = gets.chomp.upcase
  strings_of_input = []
  strings_of_input << user_input

  x = uses_available_letters?(user_input, letters_taken)


  word_sum = score_word(user_input)

  puts "Would you like to draw again?"
  close_program = gets.chomp

  if close_program == "yes" || close_program == "YES" || close_program == "Yes" ||close_program == "y" || close_program == "Y"
    in_progress = true
  else

    puts "These are all the words created: #{@words_created}"


    puts "This is the final winner: #{highest_score_from_words(@words_created)}"
    puts "Thanks for playing. Goodbye!"
    in_progress = false
  end

end
