defmodule Aquario.Tanks do
  @moduledoc """
  The.Tanks context.
  """

  import Ecto.Query, warn: false
  alias Aquario.Repo

  alias Aquario.Tanks.Tank

  @doc """
  Returns the list of tanks.

  ## Examples

      iex> list_tanks()
      [%Tank{}, ...]

  """
  def list_tanks do
    Repo.all(Tank)
  end

  @doc """
  Gets a single tank.

  Raises `Ecto.NoResultsError` if the Tank does not exist.

  ## Examples

      iex> get_tank!(123)
      %Tank{}

      iex> get_tank!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tank!(id), do: Repo.get!(Tank, id)

  @doc """
  Creates a tank.

  ## Examples

      iex> create_tank(%{field: value})
      {:ok, %Tank{}}

      iex> create_tank(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tank(attrs \\ %{}) do
    %Tank{}
    |> Tank.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tank.

  ## Examples

      iex> update_tank(tank, %{field: new_value})
      {:ok, %Tank{}}

      iex> update_tank(tank, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tank(%Tank{} = tank, attrs) do
    tank
    |> Tank.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tank.

  ## Examples

      iex> delete_tank(tank)
      {:ok, %Tank{}}

      iex> delete_tank(tank)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tank(%Tank{} = tank) do
    Repo.delete(tank)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tank changes.

  ## Examples

      iex> change_tank(tank)
      %Ecto.Changeset{source: %Tank{}}

  """
  def change_tank(%Tank{} = tank) do
    Tank.changeset(tank, %{})
  end
end
