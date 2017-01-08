defmodule RepackReminder.ReminderView do
  use RepackReminder.Web, :view

  def current_date do
    date = DateTime.utc_now()
    {date.year, date.month, date.day}
  end
end
