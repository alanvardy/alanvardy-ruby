# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end
  test 'should get list' do
    get posts_list_url
    assert_response :success
  end

  test "shouldn't get new post without login" do
    get new_post_url
    assert_redirected_to sessions_new_path
  end

  test 'should get new post with login' do
    login_user
    get new_post_url
    assert_response :success
  end

  test "shouldn't create post without login" do
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { content: @post.content, title: @post.title } }
    end

    assert_redirected_to sessions_new_path
  end

  test 'should create post with login' do
    login_user
    assert_difference('Post.count', 1) do
      post posts_url, params: { post: { content: @post.content, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test "shouldn't get edit without login" do
    get edit_post_url(@post)
    assert_redirected_to sessions_new_path
  end

  test 'should get edit with login' do
    login_user
    get edit_post_url(@post)
    assert_response :success
  end

  test "shouldn't update post without login" do
    patch post_url(@post), params: { post: { content: @post.content, title: @post.title } }
    assert_redirected_to sessions_new_path
    @post.reload
    assert_not_equal(@post.title, '1111')
  end

  test 'can update post with login' do
    login_user
    patch post_url(@post), params: { post: { content: @post.content, title: '1111' } }
    assert_redirected_to post_path(@post)
    @post.reload
    assert_equal(@post.title, '1111')
  end

  test "shouldn't destroy post without login" do
    assert_no_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to sessions_new_path
  end

  # test "can destroy post with login" do
  #   login_user
  #   assert_difference('Post.count', -1) do
  #     delete post_url(@post)
  #   end
  #   assert_redirected_to posts_path
  # end
end
