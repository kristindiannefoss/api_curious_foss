
class MessagesController < ApplicationController
  def index
    @messages = Message.format
  end

  def show
    @message = Message.find(params[:id])
  end

end
