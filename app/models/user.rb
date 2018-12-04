class User
  include ActiveModel::Model
  attr_accessor :username, :password
  def initialize(username = nil, password = nil)
    @username = username
    @password = password
  end

  def login_valid?
    username == (ENV['ADMIN_USERNAME'] ||= 'foo') && password == (ENV['ADMIN_PASS'] ||= 'bar')
  end
end