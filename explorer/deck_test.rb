require 'minitest/autorun'

require_relative 'deck'

class DeckTest < MiniTest::Test

  def test_num_cards_in_deck
    deck = Deck.new
    assert deck.cards.count == 52
  end

  def test_four_each_face_card
    deck = Deck.new
    assert deck.cards.count{|card| card.faces == "A"} == 4
    assert deck.cards.count{|card| card.faces == "K"} == 4
    assert deck.cards.count{|card| card.faces == "Q"} == 4
    assert deck.cards.count{|card| card.faces == "J"} == 4
    assert deck.cards.count{|card| card.faces == 10} == 4
    assert deck.cards.count{|card| card.faces == 9} == 4
    assert deck.cards.count{|card| card.faces == 8} == 4
    assert deck.cards.count{|card| card.faces == 7} == 4
    assert deck.cards.count{|card| card.faces == 6} == 4
    assert deck.cards.count{|card| card.faces == 5} == 4
    assert deck.cards.count{|card| card.faces == 4} == 4
    assert deck.cards.count{|card| card.faces == 3} == 4
    assert deck.cards.count{|card| card.faces == 2} == 4
  end

  def test_thirteen_of_each_suit
    deck = Deck.new
    assert deck.cards.count { |card| card.suits.include?("Clubs")} == 13
    assert deck.cards.count { |card| card.suits.include?("Spades")} == 13
    assert deck.cards.count { |card| card.suits.include?("Diamonds")} == 13
    assert deck.cards.count { |card| card.suits.include?("Hearts")} == 13
  end

  def test_cards_drawing
    deck = Deck.new
    deck.draw
    assert deck.cards.count == 51
  end

end
