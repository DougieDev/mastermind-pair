class Codemaker
  attr_reader :colors, :code

  def initialize
    @colors = ["R", "G", "B", "Y"]
    @code = []
  end

  def randomize
    4.times do
      code << colors.sample
    end
    code.join
  end
end
