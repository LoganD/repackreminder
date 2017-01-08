defmodule RepackReminder.ReminderTest do
  use RepackReminder.ModelCase

  alias RepackReminder.Reminder

  @valid_attrs %{confirmation: true, due_date: %{day: 17, month: 4, year: 2010}, email: "some content", name: "some content", reminder_date: %{day: 17, month: 4, year: 2010}, reminder_offset: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reminder.changeset(%Reminder{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reminder.changeset(%Reminder{}, @invalid_attrs)
    refute changeset.valid?
  end
end
