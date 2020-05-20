class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_namel(params[:name])

    if user.nil?
      redirect_to login_path, notice: 'Username is not valid'
    else
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out'
  end
end
