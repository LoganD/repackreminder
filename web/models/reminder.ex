require IEx

defmodule RepackReminder.Reminder do
  use RepackReminder.Web, :model
  use Timex

  schema "reminders" do
    field :name, :string
    field :email, :string
    field :due_date, Timex.Ecto.Date
    field :confirmation, :boolean, default: false
    field :reminder_date, Timex.Ecto.Date
    field :reminder_offset, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :due_date, :confirmation, :reminder_date, :reminder_offset])
    |> set_reminder_date(params["reminder_offset"], params["due_date"])
    |> validate_required([:name, :email, :due_date, :reminder_date, :reminder_offset])
  end

  def set_reminder_date(changeset, reminder_offset, due_date) do
    if reminder_offset != nil do
      offset = String.to_integer(reminder_offset)
      date_tuple = {String.to_integer(due_date["year"]), String.to_integer(due_date["month"]), String.to_integer(due_date["day"])}
      repack_date = elem(Date.from_erl(date_tuple), 1)
      reminder_date = Timex.shift(repack_date, days: 180 - offset)
      put_change(changeset, :reminder_date, reminder_date)
    else
      changeset
    end
  end
end
