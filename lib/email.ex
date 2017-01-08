defmodule RepackReminder.Email do
  use Bamboo.Phoenix, view: RepackReminder.EmailView

  def reminder_confirmation_email(email) do
    new_email
    |> to(email)
    |> from("info@controltower.io")
    |> subject("Confirm Your Repack Reminder!")
    |> text_body("Welcome to MyApp!")
  end
end
