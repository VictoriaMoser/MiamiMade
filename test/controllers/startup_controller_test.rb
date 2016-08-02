require 'test_helper'

class StartupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get startups_path
    assert_response :success
  end

  test "should get new" do
    get new_startup_path
    assert_response :success
  end

  test "should get edit" do
    get edit_startup_path(startups(:one))
    assert_response :success
  end

  test "should get destroy" do
    delete startup_path(startups(:one))
    assert_redirected_to startups_path
  end

end
