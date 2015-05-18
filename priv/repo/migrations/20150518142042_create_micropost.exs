defmodule RailsTutorial.Repo.Migrations.CreateMicropost do
  use Ecto.Migration

  def change do
    create table(:microspots) do
      add :content, :string
      add :user_id, :integer

      timestamps
    end

  end
end
