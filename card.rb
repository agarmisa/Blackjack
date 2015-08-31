class Card
  attr_reader :suit, :value

  def initialize (value, suit)
    @value = value
    @suit = suit
  end

  def face_card?
    ["K", "Q", "J"].include?(value)
  end

  def ace?
    value == "A"
  end
end
