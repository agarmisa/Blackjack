require_relative "card"
require_relative "deck"
require_relative "hand"

def player_turn(deck, hand)
  hand.cards.each {|card| puts "Player was dealt #{card.value}#{card.suit}"}
  puts "Player score: #{hand.hand_value}"
  puts

  puts "Hit or stand (H/S): "
  input = gets.chomp.upcase
  puts

  until input == "S"
    hand.hit_me!(deck)
    new_card = hand.cards.last
    puts "Player was dealt #{new_card.value}#{new_card.suit}"
    puts "Player score: #{hand.hand_value}"
    puts

    if hand.bust?
      return "bust"
    else
      puts "Hit or stand (H/S): "
      input = gets.chomp.upcase
      puts
    end
  end
end

def dealer_turn(deck, hand)
  hand.cards.each {|card| puts "Dealer was dealt #{card.value}#{card.suit}"}
  puts "Dealer score: #{hand.hand_value}"
  puts

  until hand.hand_value >= 17
    hand.hit_me!(deck)
    new_card = hand.cards.last
    puts "Dealer was dealt #{new_card.value}#{new_card.suit}"
    puts "Dealer score: #{hand.hand_value}"
    puts
    return "bust" if hand.bust?
  end

  puts "Dealer stands."
end

def compare_hands (player_hand, dealer_hand)
  if dealer_hand.bust?
    puts "Dealer bust! You win!"
  elsif player_hand.hand_value > dealer_hand.hand_value
    puts "You win!"
  else
    puts "You lose!"
  end
end


puts "Welcome to the Casino, Sir or Madam!"
puts "We are very excited to take your money!"
puts
deck = Deck.new()
player = Hand.new(deck)
dealer = Hand.new(deck)

if player_turn(deck, player) == "bust"
  puts "Bust! You lose..."
else
  dealer_turn(deck, dealer)
  compare_hands(player, dealer)
end
