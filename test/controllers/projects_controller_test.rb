# frozen_string_literal: true

require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test 'should get index' do
    get portfolio_path
    assert_response :success
  end

  test 'should get new when logged in' do
    login_user
    get new_project_url
    assert_response :success
  end

  test "shouldn't get new when not logged in" do
    get new_project_url
    assert_redirected_to sessions_new_path
  end

  test 'should create project when logged in' do
    login_user
    assert_difference('Project.count', 1) do
      post projects_url, params: { project: { description: @project.description, giturl: @project.giturl, image: @project.image, more: @project.more, title: @project.title, weburl: @project.weburl } }
    end
    assert_redirected_to project_url(Project.last)
  end

  test "shouldn't create project when not logged in" do
    assert_no_difference('Project.count') do
      post projects_url, params: { project: { description: @project.description, giturl: @project.giturl, image: @project.image, more: @project.more, title: @project.title, weburl: @project.weburl } }
    end
    assert_redirected_to sessions_new_path
  end

  test 'should show project' do
    get project_url(@project)
    assert_response :success
  end

  test 'should get edit when logged in' do
    login_user
    get edit_project_url(@project)
    assert_response :success
  end

  test "shouldn't get edit when not logged in" do
    get edit_project_url(@project)
    assert_redirected_to sessions_new_path
  end

  test "shouldn't update project when not logged in" do
    patch project_url(@project), params: { project: { description: @project.description, giturl: @project.giturl, image: @project.image, more: @project.more, title: @project.title, weburl: @project.weburl } }
    assert_redirected_to sessions_new_path
    @project.reload
    assert_not_equal(@project.title, '1111')
  end

  test 'should update project when logged in' do
    login_user
    patch project_url(@project), params: { project: { description: @project.description, giturl: @project.giturl, image: @project.image, more: @project.more, title: '1111', weburl: @project.weburl } }
    assert_redirected_to project_url(@project)
    @project.reload
    assert_equal(@project.title, '1111')
  end

  # test "should destroy project when logged in" do
  #   login_user
  #   assert_difference('Project.count', -1) do
  #     delete project_url(@project)
  #   end

  #   assert_redirected_to projects_url
  # end

  test "shouldn't destroy project when not logged in" do
    assert_no_difference('Project.count') do
      delete project_url(@project)
    end

    assert_redirected_to sessions_new_path
  end
end
