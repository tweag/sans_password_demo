# Sans Password Demo

This is a demo app for [SansPassword](https://github.com/promptworks/sans_password).

You'll probably want to look at the following modules:

* [`Guardian`](lib/my_app_web/guardian.ex)
* [`AuthController`](lib/my_app_web/controllers/auth_controller.ex)

## Running the demo

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Sending emails
Uncomment the mail sending line in `lib/my_app_web/guardian.ex`.

Configure the following SMTP environment variables to send emails:
- SMTP_DOMAIN
- SMTP_PORT
- SMTP_USERNAME
- SMTP_PASSWORD

Additional SMTP settings are found in `config/config.exs`.