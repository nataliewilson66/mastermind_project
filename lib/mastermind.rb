require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "Exact matches: " + @secret_code.num_exact_matches(code).to_s
    puts "Near matches: " + @secret_code.num_near_matches(code).to_s
  end

  def ask_user_for_guess
    puts "Enter a code"
    str_guess = gets.chomp
    guess = Code.from_string(str_guess)
    print_matches(guess)
    @secret_code == guess
  end

end
