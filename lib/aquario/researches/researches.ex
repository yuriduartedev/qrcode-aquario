defmodule Aquario.Researches do
  @moduledoc """
  The Researches context.
  """

  import Ecto.Query, warn: false
  alias Aquario.Repo

  alias Aquario.Researches.Research

  @doc """
  Returns the list of researches.

  ## Examples

      iex> list_researches()
      [%Research{}, ...]

  """
  def list_researches do
    Repo.all(Research)
  end

  @doc """
  Gets a single research.

  Raises `Ecto.NoResultsError` if the Research does not exist.

  ## Examples

      iex> get_research!(123)
      %Research{}

      iex> get_research!(456)
      ** (Ecto.NoResultsError)

  """
  def get_research!(id), do: Repo.get!(Research, id)

  @doc """
  Creates a research.

  ## Examples

      iex> create_research(%{field: value})
      {:ok, %Research{}}

      iex> create_research(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_research(attrs \\ %{}) do
    %Research{}
    |> Research.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a research.

  ## Examples

      iex> update_research(research, %{field: new_value})
      {:ok, %Research{}}

      iex> update_research(research, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_research(%Research{} = research, attrs) do
    research
    |> Research.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Research.

  ## Examples

      iex> delete_research(research)
      {:ok, %Research{}}

      iex> delete_research(research)
      {:error, %Ecto.Changeset{}}

  """
  def delete_research(%Research{} = research) do
    Repo.delete(research)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking research changes.

  ## Examples

      iex> change_research(research)
      %Ecto.Changeset{source: %Research{}}

  """
  def change_research(%Research{} = research) do
    Research.changeset(research, %{})
  end
end
