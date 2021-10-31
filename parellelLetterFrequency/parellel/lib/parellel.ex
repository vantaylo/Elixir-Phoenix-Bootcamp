defmodule Parellel do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, _workers) do
    texts
    |> get_all_elements()
    |> count_letters()
  end

  defp get_all_elements(texts) do
    texts
    # take all the strings and joins them together into one string
    |> Enum.join()
    # then new string is passed to next function
    # returns a list of all the individual characters in the string
    |> String.elements()
  end

  defp count_letters(elements) do
    Enum.reduce(elements, %{}, fn element, acc ->
      nil
      # if element is a letter
      # downcase the letter
      # increment the count of letter in acc

      # else
      # do nothing return acc
    end)
  end
end
