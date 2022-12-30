defmodule Day3.Part2 do
  def run do
    File.read!("./inputs/day3.txt")
    |> String.split("\n")
    |> Enum.chunk_every(3)
    |> Enum.reduce(0, fn chunk, acc ->
      [rucksack_1_str, rucksack_2_str, rucksack_3_str] = chunk

      rucksack_1 = String.codepoints(rucksack_1_str)
      rucksack_2 = String.codepoints(rucksack_2_str)
      rucksack_3 = String.codepoints(rucksack_3_str)

      duplicated_item_type =
        Enum.filter(rucksack_1, fn item -> item in rucksack_2 and item in rucksack_3 end) |> hd

      acc + priority(:binary.first(duplicated_item_type))
    end)
    |> IO.puts()
  end

  defp priority(item_type) when item_type < 91, do: item_type - 38
  defp priority(item_type), do: item_type - 96
end

Day3.Part2.run()
