require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  setup do
    u = User.new(name: "Victoria", email:"v@gmail.com", password:"p")
    u.save!
  end
  test "successful login" do
     # visit the homepage
     visit root_path
     #click the login link
     click_link "Login"
     #fill in email
     fill_in "Email", with: "v@gmail.com"
     #fill in password
     fill_in "Password", with: "p"
     #click on login button
     click_button "Login"
     #expect to see signed in as name
     assert page.has_content?("Signed in as V"), "Failed to login"
  end
end
