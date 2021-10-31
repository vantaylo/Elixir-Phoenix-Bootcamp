defmodule Parellel do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> get_all_elements()
    |> count_letters()
  end

  defp get_all_elements(texts) do
    texts
  end

  defp count_letters(elements) do
    elements
  end
end
