class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    gon.current_tab = "home"
  end
  
  def contacts
    gon.current_tab = "contacts"
  end
end
