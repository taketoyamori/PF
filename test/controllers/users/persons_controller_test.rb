require 'test_helper'

class Users::PersonsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_persons_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_persons_edit_url
    assert_response :success
  end
end
