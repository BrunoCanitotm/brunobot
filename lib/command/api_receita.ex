defmodule Brunobot.Command.ApiReceita do
  @moduledoc """
  Sugere receitas aleatórias usando a API MealDB.
  """

  @api_url "https://www.themealdb.com/api/json/v1/1/random.php"

  def receita_aleatoria do
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: %{"meals" => [receita | _]}}} ->
        formatar_receita(receita)

      {:ok, %{status: 200, body: %{"meals" => nil}}} ->
        "🍽️ Nenhuma receita encontrada. O banco de dados pode estar vazio!"

      {:error, reason} ->
        "🔥 Erro ao buscar receita: #{inspect(reason)}"

      _ ->
        "👨‍🍳 Cozinha fechada para manutenção"
    end
  end

  defp formatar_receita(receita) do
    ingredientes =
      1..20
      |> Enum.map(fn n ->
        if receita["strIngredient#{n}"] != "" and receita["strIngredient#{n}"] != nil do
          "• #{receita["strIngredient#{n}"]} - #{receita["strMeasure#{n}"]}"
        end
      end)
      |> Enum.filter(& &1)

    """
    🍴 #{receita["strMeal"]} (#{receita["strArea"]})
    📺 Assista em: #{receita["strYoutube"] || "Sem vídeo disponível"}
    📝 Ingredientes:
    #{Enum.join(ingredientes, "\n")}
    """
  end
end
