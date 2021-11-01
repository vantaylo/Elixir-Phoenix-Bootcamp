defmodule Frequency do
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
    |> Enum.join()
    |> String.elements()
  end

  defp count_letters(elements) do
    Enum.reduce(elements, %{}, fn element, acc ->
      if String.match?(element, ~r/^\p{L}$/u) do
        downcased_letter = String.downcase(element)
        Map.update(acc, downcased_letter, 1, fn count -> count + 1 end)
      else
        acc
      end
    end)
  end
end
