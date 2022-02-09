class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample 
  end 

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end 

  def get_matching_indices(c)
    new_array = []
    @secret_word.each_char.with_index do |char, i|
      if char == c  
        new_array << i 
      end 
    end 
    new_array 
  end 

  def fill_indices(c, array)
    array.each do |idx|
      @guess_word[idx] = c  
    end
  end 

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false 
    end 

    @attempted_chars << char 
    
    match = self.get_matching_indices(char)
    self.fill_indices(char, match)
    @remaining_incorrect_guesses -= 1 if match.empty?
    true 
  end 

  def ask_user_for_guess 
    puts "Enter a char:"
    char = gets.chomp
    self.try_guess(char)
  end 

  def win?
    if @guess_word.join == @secret_word
      puts "You WIN"
      return true
    end 
    return false  
  end 

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "You LOSE"
      return true 
    end 
    return false 
  end 

  def game_over?
    if self.win? || self.lose?
      puts "The word is #{@secret_word}"
      return true
    end 
    return false 
  end 

end
