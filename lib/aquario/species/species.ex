defmodule Aquario.Species do
  @moduledoc """
  The Species context.
  """

  import Ecto.Query, warn: false
  alias Aquario.Repo

  alias Aquario.Species.Specy

  @doc """
  Returns the list of species.

  ## Examples

      iex> list_species()
      [%Specy{}, ...]

  """
  def list_species do
    Repo.all(Specy)
  end

  @doc """
  Gets a single specy.

  Raises `Ecto.NoResultsError` if the Specy does not exist.

  ## Examples

      iex> get_specy!(123)
      %Specy{}

      iex> get_specy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_specy!(id), do: Repo.get!(Specy, id)

  @doc """
  Creates a specy.

  ## Examples

      iex> create_specy(%{field: value})
      {:ok, %Specy{}}

      iex> create_specy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_specy(attrs \\ %{}) do
    %Specy{}
    |> Specy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a specy.

  ## Examples

      iex> update_specy(specy, %{field: new_value})
      {:ok, %Specy{}}

      iex> update_specy(specy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_specy(%Specy{} = specy, attrs) do
    specy
    |> Specy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Specy.

  ## Examples

      iex> delete_specy(specy)
      {:ok, %Specy{}}

      iex> delete_specy(specy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_specy(%Specy{} = specy) do
    Repo.delete(specy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking specy changes.

  ## Examples

      iex> change_specy(specy)
      %Ecto.Changeset{source: %Specy{}}

  """
  def change_specy(%Specy{} = specy) do
    Specy.changeset(specy, %{})
  end
end
