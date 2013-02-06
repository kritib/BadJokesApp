class SessionsController < ApplicationController

  def create
    @user = User.where(:username => (params[:username])).first
    unless @user.nil?
      @user.refresh_token
      session[:user_token] = @user.session_token
      redirect_to '/'
    end
  end

  def destroy
    session[:user_token] = nil
    redirect_to '/'
  end
end
