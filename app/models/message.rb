# typed: true
require 'mailgun-ruby'

# For sending mailgun messages from the contact page
class Message
  extend T::Sig
  include ActiveModel::Model

  attr_accessor :name, :email, :phone_number, :body
  validates :name, :body, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  sig { void }
  def send
    mg_client = Mailgun::Client.new ENV['mailgun_secret_api_key']
    info = {
      from: email,
      to: 'alan@alanvardy.com',
      subject: "Email from #{name} - alanvardy.com",
      text: "From: #{name}, Email: #{email}, Phone: #{phone_number} \n\n #{body}"
    }
    mg_client.send_message 'mg.alanvardy.com', info
  end
end
