require 'test_helper'

class Users::BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_blogs_index_url
    assert_response :success
  end

  test "should get show" do
    get users_blogs_show_url
    assert_response :success
  end
end
