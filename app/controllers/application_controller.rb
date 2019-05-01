class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private
  def current_user
    @current_user ||= current_donor || current_company || current_socialcompany
  end
end
