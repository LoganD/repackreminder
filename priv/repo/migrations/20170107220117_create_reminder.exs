defmodule RepackReminder.Repo.Migrations.CreateReminder do
  use Ecto.Migration

  def change do
    create table(:reminders) do
      add :name, :string
      add :email, :string
      add :due_date, :utc_datetime
      add :confirmation, :boolean, default: false, null: false
      add :reminder_date, :utc_datetime

      timestamps()
    end

  end
end
