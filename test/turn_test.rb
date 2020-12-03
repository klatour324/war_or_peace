require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    @player1 = Player.new('Clarissa', deck1)
    @player2 = Player.new('Tracy', deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_a_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_readable_attributes
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_can_have_basic_type
    assert_equal :basic, @turn.type
  end

  def test_it_returns_war_when_both_players_first_cards_are_the_same
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:club, '10', 10)

    deck = Deck.new([card1, card2])

    player1 = Player.new('Clarissa', deck)
    player2 = Player.new('Tracy', deck)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end
end
