class User
  include ActiveModel::Model
  attr_accessor :username, :password

  def login_valid?
    @username == (ENV['ADMIN_USERNAME'] ||= 'foo') && @password == (ENV['ADMIN_PASS'] ||= 'bar')
  end
end