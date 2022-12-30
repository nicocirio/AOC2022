defmodule Day4.Part2 do
  def run do
    File.read!("./inputs/day4.txt")
    |> String.split("\n")
    |> Enum.reduce(0, fn str, acc ->
      # n1-n2, n3-n4

      limits = Regex.named_captures(~r/(?<n1>\d+)-(?<n2>\d+),(?<n3>\d+)-(?<n4>\d+)/, str)

      n1 = String.to_integer(limits["n1"])
      n2 = String.to_integer(limits["n2"])
      n3 = String.to_integer(limits["n3"])
      n4 = String.to_integer(limits["n4"])

      if (n1 <= n3 and n2 >= n3) or
           (n1 >= n3 and n2 <= n4) or (n1 <= n3 and n2 >= n3) or (n1 <= n4 and n2 >= n4) do
        acc + 1
      else
        acc
      end
    end)
    |> IO.puts()
  end
end

Day4.Part2.run()
