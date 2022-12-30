defmodule Day2.Part1 do
  def run do
    File.read!("./inputs/day2.txt")
    |> String.split("\n")
    |> Enum.reduce(0, fn str, acc ->
      [elf_play, my_play] = String.split(str, " ")

      shape_value(my_play) + game_score(elf_play, my_play) + acc
    end)
    |> IO.puts()
  end

  defp shape_value(shape) when shape in ["A", "X"], do: 1
  defp shape_value(shape) when shape in ["B", "Y"], do: 2
  defp shape_value(shape) when shape in ["C", "Z"], do: 3

  defp game_score("A", "X"), do: 3
  defp game_score("B", "Y"), do: 3
  defp game_score("C", "Z"), do: 3
  defp game_score("A", "Y"), do: 6
  defp game_score("B", "Z"), do: 6
  defp game_score("C", "X"), do: 6
  defp game_score(_, _), do: 0
end

Day2.Part1.run()
