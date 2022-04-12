defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&trim_convert_evaluate/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}),
    do: {:error, "Ooops! Error while reading the file! '#{reason}'."}

  defp trim_convert_evaluate(elem) do
    elem
    |> String.trim()
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(elem) when rem(elem, 3) == 0 and rem(elem, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(elem) when rem(elem, 3) == 0, do: :fizz
  defp evaluate_numbers(elem) when rem(elem, 5) == 0, do: :buzz
  defp evaluate_numbers(elem), do: elem
end
