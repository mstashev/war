require 'minitest/autorun'
require_relative 'card'

class CardTest < MiniTest::Test

  def test_ace_equal_fourteen
    card = Card.new("Clubs","A")
    assert_equal 14, card.value
  end

  def test_king_equal_thirteen
    card = Card.new("Clubs","K")
    assert_equal 13, card.value

  end

  def test_queen_equal_twelve
    card = Card.new("Clubs","Q")
    assert_equal 12, card.value

  end

  def test_jack_equal_eleven
    card = Card.new("Clubs","J")
    assert_equal 11, card.value

  end

  def test_card_for_face_suit_value
    card = Card.new("Clubs","A")
    assert_equal "Clubs", card.suit
    assert_equal "A", card.face
    assert_equal 14, card.value
  end

  def test_card_can_be_compared_greater
    card1 = Card.new("Clubs", "Q")
    card2 = Card.new("Clubs", "J")
    assert card1 > card2
  end

  def test_card_can_be_compared_less
    card1 = Card.new("Clubs", 10)
    card2 = Card.new("Clubs", "J")
    assert card1 < card2
  end

  def test_card_can_be_compared_equal
    card1 = Card.new("Clubs", "Q")
    card2 = Card.new("Spades", "Q")
    assert card1 == card2
  end



end
