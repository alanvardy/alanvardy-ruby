class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
def create
    @message = Message.new message_params
if @message.valid?
      mg_client = Mailgun::Client.new ENV['mailgun_secret_api_key']
      email_params = {
        from: message_params[:email],
        to:   'alan@alanvardy.com',
        subject: "Email from #{message_params[:name]} - alanvardy.com",
        text:    "From: #{message_params[:name]}, Email: #{message_params[:email]}, Phone: #{message_params[:phone_number]} \n\n #{message_params[:body]}"
                    }
      mg_client.send_message 'mg.alanvardy.com', email_params
      redirect_to root_path
      flash[:success] = "I have received your message and will be in touch soon!"
    else
      flash[:warning] = "There was an error sending your message. Please try again."
      render :new
    end
  end
private
def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end
end