require 'test_helper'

class Users::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_messages_create_url
    assert_response :success
  end
end
