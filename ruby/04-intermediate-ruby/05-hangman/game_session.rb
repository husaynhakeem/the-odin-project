require './session_repo.rb'
require './session.rb'

class GameSession

  $save_and_quit = "0"

  def initialize(session, session_repo)
    @remaining_attempts = session.remaining_attempts
    @secret_word = session.secret_word
    @guesses = session.guesses
    @session_repo = session_repo
  end

  public

  def play
    save_and_quit = false

    while !save_and_quit && !has_user_won && @remaining_attempts > 0
      puts "\n#{@guesses}\nRemaining attempts: #{@remaining_attempts}\n\n"

      # Allow user to save and quit, or to continue playing
      print "To save and quit, enter #{$save_and_quit}. Or continue playing and enter a character: "
      input = gets.chomp.to_s

      # If the user chooses to save and quit
      if input == $save_and_quit
        save_session
        save_and_quit = true
      elsif is_valid_guess?(input)
        # Decrement remaining attempts
        @remaining_attempts -= 1

        # Verify the user's guess
        verify_guess(input)
      else
        puts "Invalid input. Try again"
      end
    end

    if has_user_won
      puts "\nYou've won!\n\n"
    elsif @remaining_attempts == 0
      puts "\nNo more remaining attempts. You've lost! The word was #{@secret_word}.\n\n"
    end
  end

  private

  # Verifies and returns whether the guess was correct
  def verify_guess(guess)
    if @secret_word.include?(guess)
      # Replace all occurrences of `guess` in guesses
      @secret_word.each_char.each_with_index do |char, index|
        if char == guess
          @guesses[index] = char
        end
      end

      # Display correct message + guesses + remaining attempts
      puts "Correct guess!"
      true
    else
      # Display error message + guesses + remaining attempts
      puts "Wrong guess!"
      false
    end
  end

  def is_valid_guess?(input)
    input.match?(/\A[a-z]\z/)
  end

  def save_session
    session = Session.new(@remaining_attempts, @secret_word, @guesses)
    @session_repo.save(session)
    puts "Your game has been saved!"
  end

  def has_user_won
    !@guesses.include?("_")
  end
end