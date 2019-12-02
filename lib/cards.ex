# to run console run iex -S mix
# to install deps run mix deps.get
# to compile help run mix docs
# to test run mix test
# in IEx run recompile to recompile all code
# elixir immutability. Send to f-tion with modifing copying data
defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Returns a list of strings representing a deck of playing cards.
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
  
  @doc """
    Determines whether a deck contains a given card
    
  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Two of Spades")
      true
  """
  def contains?(deck, card) do
    deck|>Enum.member?(card)
  end
  
  # Cards.deal(deck, 5) # { *hand*, *deck* }
  # Cards.deal(deck, 5) # { hand: [], deck: [] } - in ruby
  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.
    
    ## Examples
        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck,2)
        iex> hand
        ["Ace of Spades", "Two of Spades"]
  """
  def deal(deck, hand_size) do
    deck|>Enum.split(hand_size)
  end
  
  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  
  def load(filename) do
    # {status, binary} = File.read(filename)
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "That file does not exist"
    # end
    
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end
  
  def create_hand(hand_size) do
    Cards.create_deck
      |>shuffle
      |>deal(hand_size)
  end
end
