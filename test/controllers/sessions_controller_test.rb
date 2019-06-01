require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sessions_new_path
    assert_response :success
  end

  test 'should get login' do
    get login_path
    assert_response :success
  end
end
