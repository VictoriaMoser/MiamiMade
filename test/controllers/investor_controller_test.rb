require 'test_helper'

class InvestorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get investors_path
    assert_response :success
  end

  test "should get new" do
    get new_investor_path
    assert_response :success
  end

  test "should get edit" do
    get edit_investor_path(investors(:one))
    assert_response :success
  end

  test "should get destroy" do
    delete investor_path(investors(:one))
    assert_redirected_to investors_path
  end

end
