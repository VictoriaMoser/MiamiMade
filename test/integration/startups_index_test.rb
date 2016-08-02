require 'test_helper'

class StartupsIndexTest < ActionDispatch::IntegrationTest
  setup do
    s = Startup.new(name:"Victoria's Secret", email:"vs@gmail.com", website:"www.victoriasecret.com", address:"VS Main St", founded_date:"2016-03-02", approval: true)
    s.save!

  end

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
    ["Victoria's Secret", "vs@gmail.com", "www.victoriasecret.com","2016-03-02"].each do |content|
      assert page.has_content?(content)
    end
  end
end
