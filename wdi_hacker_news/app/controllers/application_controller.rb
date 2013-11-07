class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if cookies[:auth_token]
      @current_user = @current_user || User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
    else
      nil
    end
  end
end
