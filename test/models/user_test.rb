require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Good username and password logs in successfully" do
    user = User.new(username: 'foo', password: 'bar')
    assert user.login_valid?
  end

  test "Bad username fails login" do
    user = User.new(username: 'blah', password: 'bar')
    assert_not user.login_valid?
  end

  test "Bad password fails login" do
    user = User.new(username: 'foo', password: 'bananas')
    assert_not user.login_valid?
  end
end
