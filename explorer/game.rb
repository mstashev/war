require 'tty'
require_relative 'card'
require_relative 'deck'

class Game

  #2 player decks
  attr_accessor :p1deck, :p2deck, :prompt, :p1card, :p2card, :p1winnings, :p2winnings, :discard, :num_games

  def initialize
    @prompt = TTY::Prompt.new
    @p1deck = Deck.new
    @p2deck = Deck.new
    @p1card = p1card
    @p2card = p2card
    @p1winnings = []
    @p2winnings = []
    @discard = []
    @num_games = 0.to_i
  end


  def play
    # puts self.inspect
    # if prompt.yes?("Would you like to play WAR!?")
      @p1card = p1deck.draw
      if p1card == nil
        puts "P2 won."
      end
      @p2card = p2deck.draw
      if p2card == nil
        puts "P1 won."
      end

      puts @num_games
      determine_winner


    # else
    #   end_game
    # end
  end

  def p1_win?(p1card,p2card)
    # puts p1card.inspect
    # puts p2card.inspect
    p1card.values > p2card.values
  end

  def p2_win?(p1card,p2card)
    # puts p1card.inspect
    # puts p2card.inspect
    p1card.values < p2card.values
  end

  def tie?(p1card,p2card)
    # puts p1card.inspect
    # puts p2card.inspect
    p1card.values == p2card.values
  end

  def determine_winner
    puts self.inspect
    if p1_win?(p1card,p2card)
      puts "Player 1 won"
      p1winnings << p1card
      p1winnings << p2card
      # puts "Player 1 winnings: #{p1winnings.inspect}"
      @num_games += 1
    elsif p2_win?(p1card,p2card)
      puts "Player 2 won"
      p2winnings << p1card
      p2winnings << p2card
      # puts "Player 2 winnings: #{p2winnings.inspect}"
      @num_games += 1
    elsif tie?(p1card,p2card)
      puts "You tied. Discard both cards"
      discard << p1card
      discard << p2card
      # puts "Discard pile: #{discard.inspect}"
      @num_games += 1
    else
      puts "Shouldn't need this"
    end
    play_game
  end


def play_game
  # if p1deck.cards.count == 0 && p1winnings.length != 0
  #   p1deck.cards << p1winnings
  # elsif p2deck.cards.count == 0 && p2winnings .length!= 0
  #   p2deck.cards << p2winnings
  # else
    if p1deck.cards.length == 0 && p1winnings.length != 0
      puts "Player 2 won this game after #{num_games}"
    elsif p2deck.cards.length == 0 && p2winnings.length != 0
      puts "Player 2 won this game after #{num_games}"
    else
      play # puts "Everyone lost!"
    end
  # end
  # play
end



  # def ask_for_rematch
  #   # if prompt.yes?("Would you like a rematch?")
  # end

  def end_game
    puts "Goodbye"
    exit
  end
end

Game.new.play
