# to run console run iex -S mix
# to install deps run mix deps.get
# in IEx run recompile to recompile all code
# elixir immutability. Send to f-tion with modifing copying data
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
