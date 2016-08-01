require 'test_helper'

class RegisterTest < ActionDispatch::IntegrationTest
  test "Successful registration" do
    #visit the home page
    visit root_path
    #click on register link
    click_link "Register"
    #fill in name
    fill_in "Name", with: "Alex"
    #fill in email
    fill_in "Email", with: "alex@alex.com"
    #fill in password
    fill_in "Password", with: "alex"
    #fill in password confirmation
    fill_in "Password confirmation", with: "alex"
    #click on the register button
    click_button "Register"
    #expect to see homepage
    assert page.has_content?("Signed in as Alex"), "Failed to Register!"
  end
end
