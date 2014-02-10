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
    :user_name => ENV["SENDGRID_USERNAME"],
    :password => ENV["SENDGRID_PASSWORD"],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}