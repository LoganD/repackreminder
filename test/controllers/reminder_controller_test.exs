defmodule RepackReminder.ReminderControllerTest do
  use RepackReminder.ConnCase

  alias RepackReminder.Reminder
  @valid_attrs %{confirmation: true, due_date: %{day: 17, month: 4, year: 2010}, email: "some content", name: "some content", reminder_date: %{day: 17, month: 4, year: 2010}, reminder_offset: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, reminder_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing reminders"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, reminder_path(conn, :new)
    assert html_response(conn, 200) =~ "New reminder"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, reminder_path(conn, :create), reminder: @valid_attrs
    assert redirected_to(conn) == reminder_path(conn, :index)
    assert Repo.get_by(Reminder, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, reminder_path(conn, :create), reminder: @invalid_attrs
    assert html_response(conn, 200) =~ "New reminder"
  end

  test "shows chosen resource", %{conn: conn} do
    reminder = Repo.insert! %Reminder{}
    conn = get conn, reminder_path(conn, :show, reminder)
    assert html_response(conn, 200) =~ "Show reminder"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, reminder_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    reminder = Repo.insert! %Reminder{}
    conn = get conn, reminder_path(conn, :edit, reminder)
    assert html_response(conn, 200) =~ "Edit reminder"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    reminder = Repo.insert! %Reminder{}
    conn = put conn, reminder_path(conn, :update, reminder), reminder: @valid_attrs
    assert redirected_to(conn) == reminder_path(conn, :show, reminder)
    assert Repo.get_by(Reminder, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    reminder = Repo.insert! %Reminder{}
    conn = put conn, reminder_path(conn, :update, reminder), reminder: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit reminder"
  end

  test "deletes chosen resource", %{conn: conn} do
    reminder = Repo.insert! %Reminder{}
    conn = delete conn, reminder_path(conn, :delete, reminder)
    assert redirected_to(conn) == reminder_path(conn, :index)
    refute Repo.get(Reminder, reminder.id)
  end
end
