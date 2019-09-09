# typed: false
require 'application_system_test_case'

class NavigationTest < ApplicationSystemTestCase
  test 'can traverse the site' do
    visit root_url
    assert_content 'Welcome!'
    click_first 'Blog'
    assert_content 'Latest Posts'
    click_first 'Portfolio'
    assert_content 'Website'
    assert_content 'Github'
  end
end
