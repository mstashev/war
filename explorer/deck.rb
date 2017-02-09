require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    suits = %w(Clubs Spades Diamonds Hearts)
    faces = (2..10).to_a + %w(J Q K A)
    @cards = []
    suits.each do |suit|
      faces.each do |face|
        cards << Card.new(suit, face)
      end
    end
    cards.shuffle!
  end

  def draw
    @cards.shift
  end

  def dry?
    cards.empty?
  end

end
