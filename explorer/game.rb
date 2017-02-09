require 'tty'
require_relative 'card'
require_relative 'deck'

class Game

  attr_accessor :p1deck,
                :p2deck,
                :prompt,
                :p1card,
                :p2card,
                :p1win,
                :p2win,
                :discard,
                :rounds,
                :ties

  def initialize
    @prompt = TTY::Prompt.new
    @p1deck = Deck.new
    @p2deck = Deck.new
    @p1card = p1card
    @p2card = p2card
    @p1win = []
    @p2win = []
    @discard = []
    @rounds = 0
    @ties = 0
  end


  def play
    @p1card = p1deck.draw
    if p1card.value == nil
      puts "P2 won."
    end
    @p2card = p2deck.draw
    if p2card.value == nil
      puts "P1 won."
    end
    determine_winner
  end

  def p1_win?(p1card,p2card)
    p1card.value > p2card.value
  end

  def p2_win?(p1card,p2card)
    p1card.value < p2card.value
  end

  def tie?(p1card,p2card)
    p1card.value == p2card.value
  end

  def determine_winner
    @rounds += 1
    if p1_win?(p1card,p2card)
      puts "Player 1 won"
      p1win << p1card
      p1win << p2card
    elsif p2_win?(p1card,p2card)
      puts "Player 2 won"
      p2win << p1card
      p2win << p2card
    elsif tie?(p1card,p2card)
      puts "You tied. Discard both cards"
      @ties += 1
    else
      puts "Shouldn't need this"
    end
    play_game
  end


  def play_game
    if p1deck.cards.length == 0 && p1win.length != 0
      puts "Player 2 won this game after #{rounds} rounds and #{ties} wars."
    elsif p2deck.cards.length == 0 && p2win.length != 0
      puts "Player 2 won this game after #{rounds} rounds and #{ties} wars"
    else
      play
    end
  end
end
Game.new.play
