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
    # then the new string is passed to next function
    # returns a list of all the individual characters in the string
    |> String.elements()
  end

  defp count_letters(elements) do
    # reduce will return acc, passing in emunerable, empty map, function with the individual element and acc
    Enum.reduce(elements, %{}, fn element, acc ->
      # if element is a letter, match takes a string and expression. 
      # regular expression, front and back of the string match, a single char in any language, unicode
      if String.match?(element, ~r/^\p{L}$/u) do
        # downcase the letter
        downcased_letter = String.downcase(element)
        # increment the count of letter in acc
        # pass acc, key that is going to be updated, if its not on the map set value to 1, if there is already a count run fn.
        Map.update(acc, downcased_letter, 1, fn count -> count + 1 end)
      else
        # do nothing return acc
        acc
      end
    end)
  end
end
