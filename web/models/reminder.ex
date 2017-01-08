defmodule RepackReminder.Reminder do
  use RepackReminder.Web, :model

  schema "reminders" do
    field :name, :string
    field :email, :string
    field :due_date, Ecto.Date
    field :confirmation, :boolean, default: false
    field :reminder_date, Ecto.Date
    field :reminder_offset, :integer

    timestamps()
  end

  @required_fields ~w(name email due_date reminder_offset)
  @optional_fields ~w(confirmation reminder_date)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :due_date, :confirmation, :reminder_date, :reminder_offset])
    |> validate_required([:name, :email, :due_date, :confirmation, :reminder_date, :reminder_offset])
  end
end
