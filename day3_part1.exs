defmodule Day3.Part1 do
  def run do
    File.read!("./inputs/day3.txt")
    |> String.split("\n")
    |> Enum.reduce(0, fn str, acc ->
      half_position = String.length(str) |> Integer.floor_div(2)
      {compartment_1_str, compartment_2_str} = String.split_at(str, half_position)

      compartment_1 = String.codepoints(compartment_1_str)
      compartment_2 = String.codepoints(compartment_2_str)

      duplicated_item_type =
        Enum.filter(compartment_1, fn item -> item in compartment_2 end) |> hd

      acc + priority(:binary.first(duplicated_item_type))
    end)
    |> IO.puts()
  end

  defp priority(item_type) when item_type < 91, do: item_type - 38
  defp priority(item_type), do: item_type - 96
end

Day3.Part1.run()
