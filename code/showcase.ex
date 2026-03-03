defmodule Demo.Highlight do

  def process(data, opts \\ []) do
    case data do
      {:ok, value} -> value |> transform()
      :error -> raise "Oops"
    end
  end

  defp transform(str) do
    regex = ~r/\d+/
    String.replace(str, regex, "")
  end
end
