class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_filter { gon.current_tab = controller_name }
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << {
      contact_info_attributes: [
        :full_name,
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

  def require_authorized_user!
    unless user_signed_in? && current_user.authorized?
      flash.alert = "Your account must be authorized before doing that."
      redirect_to :back
    end
  end

  def require_admin!
    unless user_signed_in? && current_user.admin?
      flash.alert = "You do not have privilidges to do that."
      redirect_to :back
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
end
