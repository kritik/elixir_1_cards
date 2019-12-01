# to run console run iex -S mix
# in IEx run recompile to recompile all code
# elixi immutability. Send to f-tion with modifing copying data
defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits  = ["Spades", "Clubs", "Hearts", "Diamonds"]
    
    # for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end|>List.flatten
    for suit <-suits, value<-values do
      "#{value} of #{suit}"
    end
  end
  
  def shuffle(deck) do
    deck|>Enum.shuffle
  end
  
  def contains?(deck, card) do
    deck|>Enum.member?(card)
  end
  
  # Cards.deal(deck, 5) # { *hand*, *deck* }
  # Cards.deal(deck, 5) # { hand: [], deck: [] } - in ruby
  def deal(deck, hand_size) do
    deck|>Enum.split(hand_size)
  end
end
