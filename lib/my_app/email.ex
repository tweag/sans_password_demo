defmodule MyApp.Email do
  use Bamboo.Phoenix, view: MyApp.EmailView

  def welcome_text_email(email_address, text) do
    new_email
    |> to(email_address)
    |> from("no-reply@myapp.com")
    |> subject("My App Login URL")
    |> text_body(text)
  end

end