defmodule Day1.Part2 do
  def run do
    File.read!("./inputs/day1.txt")
    |> String.split("\n\n")
    |> Enum.map(fn elf_calories_str ->
      String.split(elf_calories_str, "\n")
      |> Enum.reduce(0, fn str, acc -> String.to_integer(str) + acc end)
    end)
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum()
    |> IO.puts()
  end
end

Day1.Part2.run()
