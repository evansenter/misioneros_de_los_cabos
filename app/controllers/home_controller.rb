class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    gon.current_tab = "home"
    @notices        = Notice.order("created_at DESC").limit(2)
  end
  
  def committees
    gon.current_tab = "committees"
  end
end
