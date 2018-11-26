require 'test_helper'

class SetupControllerTest < ActionDispatch::IntegrationTest
  test "should get ubuntu" do
    get setup_ubuntu_url
    assert_response :success
  end

  test "should get zsh" do
    get setup_zsh_url
    assert_response :success
  end

  test "should get ruby" do
    get setup_ruby_url
    assert_response :success
  end

  test "should get vscode" do
    get setup_vscode_url
    assert_response :success
  end

  test "should get gnome" do
    get setup_gnome_url
    assert_response :success
  end

end
