require 'minitest/autorun'
require_relative 'card'

class CardTest < MiniTest::Test

  def test_ace_equal_fourteen
    card = Card.new("Clubs","A")
    assert card.values == 14
  end

  def test_king_equal_thirteen
    card = Card.new("Clubs","K")
    assert card.values == 13

  end

  def test_queen_equal_twelve
    card = Card.new("Clubs","Q")
    assert card.values == 12

  end

  def test_jack_equal_eleven
    card = Card.new("Clubs","J")
    assert card.values == 11

  end

  def test_card_for_face_suit_value
    card = Card.new("Clubs","A")
    assert card.suits != "" || nil
    assert card.faces != "" || nil
    assert card.values != "" || nil
  end

end
