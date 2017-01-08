defmodule RepackReminder.Repo.Migrations.UpdateReminderTable do
  use Ecto.Migration

  def change do
    alter table(:reminders) do
      add :reminder_offset, :integer
    end
  end
end
