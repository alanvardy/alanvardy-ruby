# typed: false
require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get static_index_url
    assert_response :success
  end

  test 'should get aboutme' do
    get static_aboutme_url
    assert_response :success
  end

  test 'should get contact' do
    get contact_url
    assert_response :success
  end
end
