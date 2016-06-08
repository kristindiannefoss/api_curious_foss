class SessionsController < ApplicationController

  # def create
  #   @user = User.find_or_create_from_auth_hash(auth_hash)
  #   self.current_user = @user
  #   redirect_to '/'
  # end

  def create
    auth = request.env["omniauth.auth"]
    if user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user_path(user.username)
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Come back soon you will!'
    end
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end

  # def create
  #   begin
  #     @user = User.from_omniauth(request.env['omniauth.auth'])
  #     session[:user_id] = @user.id
  #     flash[:success] = "Welcome, #{@user.name}!"
  #   rescue
  #     flash[:warning] = "An error there was while trying to authenticate you..."
  #   end
  #   redirect_to root_path
  # end
  #
  #
  # def destroy
  #   if current_user
  #     session.delete(:user_id)
  #     flash[:success] = 'Come back soon you will!'
  #   end
  #   redirect_to root_path
  # end
end
