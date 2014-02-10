# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MisionesDelCabo::Application.initialize!

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => Figaro.env.sendgrid_username,
    :password => Figaro.env.sendgrid_password,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}