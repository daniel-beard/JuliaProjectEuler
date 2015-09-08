#=
In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

High Card: Highest value card.
One Pair: Two cards of the same value.
Two Pairs: Two different pairs.
Three of a Kind: Three cards of the same value.
Straight: All cards are consecutive values.
Flush: All cards of the same suit.
Full House: Three of a kind and a pair.
Four of a Kind: Four cards of the same value.
Straight Flush: All cards are consecutive values of same suit.
Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

Consider the following five hands dealt to two players:

Hand	 	Player 1	 	Player 2	 	Winner
1	 	5H 5C 6S 7S KD
Pair of Fives
 	2C 3S 8S 8D TD
Pair of Eights
 	Player 2
2	 	5D 8C 9S JS AC
Highest card Ace
 	2C 5C 7D 8S QH
Highest card Queen
 	Player 1
3	 	2D 9C AS AH AC
Three Aces
 	3D 6D 7D TD QD
Flush with Diamonds
 	Player 2
4	 	4D 6S 9H QH QC
Pair of Queens
Highest card Nine
 	3D 6D 7H QD QS
Pair of Queens
Highest card Seven
 	Player 1
5	 	2H 2D 4C 4D 4S
Full House
With Three Fours
 	3C 3D 3S 9S 9D
Full House
with Three Threes
 	Player 1
The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?
=#
type PokerHand
  cards::Dict{Int, Int}
  suits::Dict{Int, Int}
  function PokerHand(cardArray, suitArray)
    cards, suits = Dict{Int, Int}(), Dict{Int, Int}()
    for i in zip(cardArray, suitArray)
      cardvalue, suitvalue = get(cards, i[1], 0), get(suits, i[2], 0)
      cards[i[1]], suits[i[2]] = cardvalue + 1, suitvalue + 1
    end
    new(cards, suits)
  end
end

function handRank(hand::PokerHand)
  if isFlush(hand) && filter(x->findfirst([10:14],x)!=0, collect(keys(hand.cards))) |> length == 5
    return 10 # Royal Flush
  end
  if isFlush(hand) && isStraight(hand)
    return 9 # Straight Flush
  end
  if filter(x->x==4, collect(values(hand.cards))) |> length == 1
    return 8 # Four of a Kind
  end
  if filter(x->x==3, collect(values(hand.cards))) |> length == 1 && filter(x->x==2, collect(values(hand.cards))) |> length == 1
    return 7 # Full House
  end
  if isFlush(hand)
    return 6 # Flush
  end
  if isStraight(hand)
    return 5 # Straight
  end
  if filter(x->x==3, collect(values(hand.cards))) |> length == 1
    return 4 # Three of A Kind
  end
  if filter(x->x==2, collect(values(hand.cards))) |> length == 2
    return 3 # Two Pair
  end
  if filter(x->x==2, collect(values(hand.cards))) |> length == 1
    return 2 # One Pair
  end
  1 # High Card
end

function isFlush(hand::PokerHand)
  length(keys(hand.suits)) == 1
end

function isStraight(hand::PokerHand)
  k = reverse(sort(collect(keys(hand.cards))))
  if k |> length != 5 return false end
  return k[1] - k[5] == 4
end

function histogram(hand::PokerHand)
  sortedWithinRanks = Dict{Int, Array{Int, 1}}()
  for (key, value) in hand.cards
    existing = get(sortedWithinRanks, value, Int[])
    if existing |> length == 0
      sortedWithinRanks[value] = [key]
    else
      sortedWithinRanks[value] = push!(existing, key)
    end
  end
  for (key, value) in sortedWithinRanks
    sortedWithinRanks[key] = reverse(sort(value))
  end
  result, hist = Int[], Int[]
  for key in reverse(sort(collect(keys(sortedWithinRanks))))
    for rank in sortedWithinRanks[key] |> sort |> reverse
      push!(hist, key)
      append!(result, fill(rank, key))
    end
  end
  (hist, result)
end

function <(x::PokerHand, y::PokerHand)
  rank1, rank2, rank = handRank(x), handRank(y), handRank(x)
  if rank1 < rank2
    return true
  elseif rank1 != rank2
    return false
  end
  xRanks, yRanks = histogram(x)[2], histogram(y)[2]
  for i in zip(xRanks, yRanks)
    if i[1] < i[2] return true end
    if i[1] > i[2] return false end
  end
  false
end

function cardvalue(n)
  value = findfirst(["T", "J", "Q", "K", "A"], n) + 9
  if value >= 10 && value < 15 return value end
  return int(n)
end

function suitvalue(n)
  return findfirst(["H", "C", "D", "S"], n)
end

function calc()
  count = 0
  hands = readdlm(dirname(@__FILE__()) * "/../Resources/p54.txt", ' ', String)
  for i in 1:1000
      suits, cards = Int[], Int[]
      for j in 1:10
        card = hands[i,j]
        cardstring = chop(card)
        suitstring = card[length(card):length(card)]
        push!(cards, cardvalue(cardstring))
        push!(suits, suitvalue(suitstring))
      end
      hand1 = PokerHand(cards[1:5], suits[1:5])
      hand2 = PokerHand(cards[6:10], suits[6:10])
      if (hand1 < hand2) == false
        count = count + 1
      end
  end
  count
end
@time println(calc())
