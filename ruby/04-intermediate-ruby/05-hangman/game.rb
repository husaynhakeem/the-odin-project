require './session_repo.rb'
require './game_session.rb'

class Game

  $dictionary_file_name = "dictionary.txt"

  $secret_word_length_min = 5
  $secret_word_length_max = 12

  $attempts_initial = 5

  $start_new_game = 0
  $continue_previous_game = 1

  public

  def play
    session_repo = SessionRepo.new
    while true
      print "To start a new game, enter #{$start_new_game}. To continue a previous game, enter #{$continue_previous_game}: "
      begin
        input = gets.chomp.to_i

        # Make sure input is valid
        unless input == $start_new_game || input == $continue_previous_game
          raise ArgumentError("Invalid input")
        end

        # Choose a secret word
        secret_word = select_secret_word

        # Prepare the game session
        session = get_session(input, secret_word, session_repo)

        # Start game session
        game_session = GameSession.new(session, session_repo)
        game_session.play

      rescue => exception
        puts "Invalid input. Try again. #{exception}"
      end
    end
  end

  private

  def select_secret_word
    secret_word = nil
    File.open($dictionary_file_name, "r") do |file|
      lines = file.readlines
      while secret_word.nil?
        random_line_index = (rand * lines.length).to_i
        random_word = lines[random_line_index]
        secret_word = random_word if random_word.length >= $secret_word_length_min && random_word.length <= $secret_word_length_max
      end
    end
    secret_word.strip.downcase
  end

  def get_session(user_input, secret_word, session_repo)
    if user_input == $start_new_game
      new_session(secret_word)
    else
      previous = session_repo.restore
      if previous.nil?
        new_session(secret_word)
      else
        previous
      end
    end
  end

  def new_session(secret_word)
    Session.new($attempts_initial, secret_word, "".rjust(secret_word.length, "_"))
  end
end