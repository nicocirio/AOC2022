defmodule Day2.Part2 do
  def run do
    File.read!("./inputs/day2.txt")
    |> String.split("\n")
    |> Enum.reduce(0, fn str, acc ->
      [elf_play, my_play] = String.split(str, " ")

      game_score(elf_play, my_play) + acc
    end)
    |> IO.puts()
  end

  defp shape_value(shape) when shape in ["A", "X"], do: 1
  defp shape_value(shape) when shape in ["B", "Y"], do: 2
  defp shape_value(shape) when shape in ["C", "Z"], do: 3

  # X need to loose
  # Y draw
  # Z win

  defp game_score("A", "X"), do: 0 + shape_value("Z")
  defp game_score("B", "X"), do: 0 + shape_value("X")
  defp game_score("C", "X"), do: 0 + shape_value("Y")

  defp game_score(elf_play, "Y"), do: 3 + shape_value(elf_play)

  defp game_score("A", "Z"), do: 6 + shape_value("Y")
  defp game_score("B", "Z"), do: 6 + shape_value("Z")
  defp game_score("C", "Z"), do: 6 + shape_value("X")
end

Day2.Part2.run()
