require 'test_helper'

class InvestorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get investor_index_url
    assert_response :success
  end

  test "should get new" do
    get investor_new_url
    assert_response :success
  end

  test "should get create" do
    get investor_create_url
    assert_response :success
  end

  test "should get edit" do
    get investor_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get investor_destroy_url
    assert_response :success
  end

end
