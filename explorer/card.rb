class Card
  include Comparable
  attr_accessor :suit, :face, :value

  def initialize(suit, face)
    @suit = suit
    @face = face
    @value = setValue[face]
  end

  def setValue
    values = Hash.new
    values['A'] = 14
    values['K'] = 13
    values['Q'] = 12
    values['J'] = 11
    values[10] = 10
    values[9] = 9
    values[8] = 8
    values[7] = 7
    values[6] = 6
    values[5] = 5
    values[4] = 4
    values[3] = 3
    values[2] = 2
    values
  end

  def <=>(other)
    value <=> other.value
  end

end
