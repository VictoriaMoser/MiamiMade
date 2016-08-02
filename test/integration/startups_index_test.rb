require 'test_helper'

class StartupsIndexTest < ActionDispatch::IntegrationTest
  test "Startups index page" do
    #visit the home page
    visit root_path
    #click on startups link
    click_link "Startups"
    #expect to see list of startups
    assert page.has_content?("List of Startups")
    #click on learn more about an specific startup
    click_link "Learn More"
    #expect to read more information about each startup
    assert page.has_content?("More information about the startup")
  end
end
