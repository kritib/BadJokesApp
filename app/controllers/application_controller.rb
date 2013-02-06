class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user
  helper_method :current_user?, :current_user

  def set_current_user
    unless session[:user_token].nil?
      @current_user = User.find_by_session_token(session[:user_token])
    else
      @current_user = nil
    end
  end

  def current_user
    @current_user
  end

  def current_user?
    !!current_user
  end

end
