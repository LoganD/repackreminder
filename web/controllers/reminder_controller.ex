defmodule RepackReminder.ReminderController do
  use RepackReminder.Web, :controller

  alias RepackReminder.Reminder

  def index(conn, _params) do
    reminders = Repo.all(Reminder)
    render(conn, "index.html", reminders: reminders)
  end

  def new(conn, _params) do
    changeset = Reminder.changeset(%Reminder{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reminder" => reminder_params}) do
    changeset = Reminder.changeset(%Reminder{}, reminder_params)

    case Repo.insert(changeset) do
      {:ok, _reminder} ->
        conn
        |> put_flash(:info, "Reminder created successfully.")
        |> redirect(to: reminder_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reminder = Repo.get!(Reminder, id)
    render(conn, "show.html", reminder: reminder)
  end

  def edit(conn, %{"id" => id}) do
    reminder = Repo.get!(Reminder, id)
    changeset = Reminder.changeset(reminder)
    render(conn, "edit.html", reminder: reminder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reminder" => reminder_params}) do
    reminder = Repo.get!(Reminder, id)
    changeset = Reminder.changeset(reminder, reminder_params)

    case Repo.update(changeset) do
      {:ok, reminder} ->
        conn
        |> put_flash(:info, "Reminder updated successfully.")
        |> redirect(to: reminder_path(conn, :show, reminder))
      {:error, changeset} ->
        render(conn, "edit.html", reminder: reminder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reminder = Repo.get!(Reminder, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reminder)

    conn
    |> put_flash(:info, "Reminder deleted successfully.")
    |> redirect(to: reminder_path(conn, :index))
  end
end
