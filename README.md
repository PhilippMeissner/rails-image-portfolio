# Rails Image Portfolio
This standalone-application comes with the following features
* Bootstrap-support
* Bootswatch Theme (Lumen - To change it, read below)
* Full-page Slider (Whole content will be automatically loaded)
* Blog-like ordering of all existing projects
* Contact-Form (Requires you to edit the email to yours. Read below)
* Legal Information
* Login-System(read below)

# Install
Run:
* bundle install
* be rake db:migrate
* be rails s

You're done :)


# Login System
Change the login-combination within application_controller.rb
* To 'log in' you will have to access the application with a key-value-pair of your wish.

Example:
* localhost:3000/?password=password (default value)

# Contact-Form
Edit your email address (where it's being sent to) within static_controller.rb
Edit the account the message is sent through within development.rb (import it to production.rb when used publically)
Remember to restart the server when you set the mail and config-mailer up.

# Bootswatch-theme
To change the theme just delete the content of bootstrap_overrides.css.sass file and fill it with your desired .css code (convert it to sass before)
