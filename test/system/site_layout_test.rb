# typed: false
require 'application_system_test_case'

class NavigationTest < ApplicationSystemTestCase
  test 'can traverse the site' do
    visit root_url
    assert_content 'Welcome!'
    click_first 'Blog'
    assert_content 'Latest Posts'
    click_first 'View Post'
    assert_content 'Created'
    assert_content 'Updated'
    click_first 'Blog'
    click_first 'Tags'
    assert_content 'Tags'
    click_first 'All Posts'
    assert_content 'Created'
    assert_content 'Updated'
    click_first 'Portfolio'
    assert_content 'Website'
    assert_content 'Github'
    click_first 'My Setup'
    assert_content 'Environment'
    click_first 'About Me'
    assert_content 'hobbits'
    click_first 'Contact Me'
    assert_current_path('/contact')
  end
end
