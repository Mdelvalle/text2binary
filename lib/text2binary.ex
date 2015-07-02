defmodule Text2binary do
  def init(text) do
    chars = text |> String.to_char_list
    Enum.each(chars, &(ascii_to_binary(&1)))
  end

  # Convert an ascii num value to binary 1s and 0s
  defp ascii_to_binary(ascii), do: ascii_to_binary(ascii, [])
  defp ascii_to_binary(0, list), do: pretty_print(Enum.reverse list)
  defp ascii_to_binary(ascii, list) do
    half = div(ascii, 2)
    rmdr = rem(ascii, 2)
    ascii_to_binary(half, (list ++ [rmdr]))
  end

  defp pretty_print(list) do
    len = length list
    cond do
      len < 8 ->
        pad = 8 - len
        for n <- 1..pad, do: IO.write 0
        for n <- list, do: IO.write n
      true ->
        for n <- list, do: IO.write n
    end
    IO.puts("")
  end
end


# user input and send to module
IO.gets("Enter a word or phrase: ")
|> String.strip
|> Text2binary.init
