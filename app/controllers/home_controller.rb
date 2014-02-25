class HomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :require_authorized_user!, only: [:maintenance_fee]
  
  NUMBER_OF_HOMEPAGE_NOTICES = 1
  
  def index
    gon.current_tab = "home"
    @notices        = Notice.order("created_at DESC").limit(NUMBER_OF_HOMEPAGE_NOTICES)
  end
  
  def committees
    gon.current_tab = "committees"
  end
  
  def maintenance_fee
    gon.current_tab = "maintenance_fee"
  end
end
