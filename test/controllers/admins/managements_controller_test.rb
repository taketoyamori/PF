require 'test_helper'

class Admins::ManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_managements_index_url
    assert_response :success
  end

end
