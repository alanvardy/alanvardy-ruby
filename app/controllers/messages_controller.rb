# typed: true

class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if verify_recaptcha(model: @message) && @message.valid?
      @message.send
      redirect_to root_path
      flash[:success] = 'I have received your message and will be in touch soon!'
    else
      flash[:warning] = 'There was an error sending your message. Please try again.'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end
end
