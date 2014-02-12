class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter { gon.current_tab = controller_name }
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << {
      contact_info_attributes: [
        :address_1,
        :address_2,
        :city,
        :state,
        :country,
        :phone_number,
        :unit_number,
        :zip
      ]
    }
  end
end
