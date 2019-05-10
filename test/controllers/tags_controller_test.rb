# frozen_string_literal: true

require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test 'should get index' do
    get tags_url
    assert_response :success
  end

  test "shouldn't get new without login" do
    get new_tag_url
    assert_redirected_to sessions_new_path
  end

  test "should get new with login" do
    login_user
    get new_tag_url
    assert_response :success
  end

  test "shouldn't create tag without login" do
    assert_no_difference('Tag.count') do
      post tags_url, params: { tag: { name: @tag.name } }
    end
    assert_redirected_to sessions_new_path
  end

  test "should create tag with login" do
    login_user
    assert_difference('Tag.count', 1) do
      post tags_url, params: { tag: { name: @tag.name } }
    end
    assert_redirected_to tag_url(Tag.last)
  end

  test 'should show tag' do
    get tag_url(@tag)
    assert_response :success
  end

  test "shouldn't get edit without login" do
    get edit_tag_url(@tag)
    assert_redirected_to sessions_new_path
  end

  test "should get edit with login" do
    login_user
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "shouldn't update tag without login" do
    patch tag_url(@tag), params: { tag: { name: @tag.name } }
    assert_redirected_to sessions_new_path
  end

  test "should update tag with login" do
    login_user
    patch tag_url(@tag), params: { tag: { name: @tag.name } }
    assert_redirected_to tag_url(@tag)
  end

  test "shouldn't destroy tag without login" do
    assert_difference('Tag.count', 0) do
      delete tag_url(@tag)
    end
    assert_redirected_to sessions_new_path
  end

  # test "should destroy tag with login" do
  #   login_user
  #   assert_difference('Tag.count', -1) do
  #     delete tag_url(@tag)
  #   end
  #   assert_redirected_to tags_url
  # end
end
