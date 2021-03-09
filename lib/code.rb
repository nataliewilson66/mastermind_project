class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr_chars)
    arr_chars.each do |char|
      if !POSSIBLE_PEGS.has_key?(char.upcase)
        return false
      end
    end
    true
  end

  def initialize(arr_pegs)
    if !Code.valid_pegs?(arr_pegs)
      raise Exception
    else
      @pegs = arr_pegs
      @pegs.each_with_index { |peg, i| @pegs[i] = peg.upcase }
    end

  end

  attr_reader :pegs

  def self.random(length)
    keys = POSSIBLE_PEGS.keys
    pegs = []
    length.times { pegs << keys.sample }
    Code.new(pegs)
  end

  def self.from_string(str_pegs)
    arr_pegs = str_pegs.chars
    Code.new(arr_pegs)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if guess[i] == @pegs[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if @pegs.include?(guess[i])
        count += 1
      end
    end
    count -= num_exact_matches(guess)
  end

  def ==(other_code)
    if self.length != other_code.length
      return false
    end
    if self.length == 
      num_exact_matches(other_code)
      return true
    end
    false
  end

end
