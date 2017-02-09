class Card
  include Comparable

  def self.faces
    ("2".."10").to_a + %w(J Q K A)
  end

  def self.suits
    %w(Clubs Spades Diamonds Hearts)
  end

  attr_accessor :suit, :face, :value

  def initialize(suit, face)
    @suit = suit
    @face = face
    @value = setValue
  end


  def setValue
    self.class.faces.index(face) + 2
  end

  def <=>(other)
    value <=> other.value
  end

end
