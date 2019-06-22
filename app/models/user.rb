# typed: true
class User
  extend T::Sig
  include ActiveModel::Model

  attr_accessor :username, :password

  sig { returns(T::Boolean) }
  def login_valid?
    if Rails.env.test?
      @username == 'foo' && @password == 'bar'
    else
      @username == (ENV['ADMIN_USERNAME']) && @password == (ENV['ADMIN_PASS'])
    end
  end
end
