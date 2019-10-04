require 'application_system_test_case'

class NavigationTest < ApplicationSystemTestCase
  def setup
    @name = 'Test'
    @email = 'test@test.com'
    @phone = '123 456-7890'
    @message = "I'm making a note here: 'HUGE SUCCESS!'"
  end

  test 'can send an email' do
    visit root_url
    click_link 'Contact Me'
    sleep 1
    fill_in 'message_name', with: @name
    fill_in 'message_email', with: @email
    fill_in 'message_phone_number', with: @phone
    fill_in 'message_body', with: @message
    click_button 'Send Form'
    assert_content 'received'
  end
end
