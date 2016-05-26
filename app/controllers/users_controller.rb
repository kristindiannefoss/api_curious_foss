class UsersController < ApplicationController
  before_action :set_user

  def show
    @name = format_first_name(@user.name)
    # @messages = Message.all
    @inbox = Message.inbox
  end

private

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def format_first_name(name)
    name.split.first
  end
end
