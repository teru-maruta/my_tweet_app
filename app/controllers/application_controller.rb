class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?

  def current_user
    return if session.blank? || (user_id = session[:user_id]).blank?
    @current_user ||= User.find_by(id: user_id)
  end

  def logged_in?
    current_user.present?
  end
end
