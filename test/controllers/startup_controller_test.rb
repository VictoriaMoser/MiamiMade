require 'test_helper'

class StartupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get startup_index_url
    assert_response :success
  end

  test "should get new" do
    get startup_new_url
    assert_response :success
  end

  test "should get create" do
    get startup_create_url
    assert_response :success
  end

  test "should get edit" do
    get startup_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get startup_destroy_url
    assert_response :success
  end

end
