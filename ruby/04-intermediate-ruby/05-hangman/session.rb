class Session

  attr_reader :remaining_attempts, :secret_word, :guesses

  def initialize(remaining_attempts, secret_word, guesses)
    @remaining_attempts = remaining_attempts
    @secret_word = secret_word
    @guesses = guesses
  end
end