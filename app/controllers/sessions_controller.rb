class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    #   flash[:warning] = "An error there was while trying to authenticate you..."
      redirect_to root_path
  end


  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Come back soon you will!'
    end
      redirect_to root_path
  end
end
