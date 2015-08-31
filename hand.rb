class Hand
  attr_reader :cards

  def initialize (deck)
    @cards = []
    2.times do
      @cards << deck.draw!
    end
  end

  def hand_value
    total_value = 0
    cards.each do |card|
      total_value += card.value.to_i
      total_value += 10 if card.face_card?
      total_value += 11 if card.ace?
    end
    total_value
  end

  def hit_me! (deck)
    @cards << deck.draw!
  end

  def bust?
    hand_value > 21
  end

end
