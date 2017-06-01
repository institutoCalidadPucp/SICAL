require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get inventories_create_url
    assert_response :success
  end

end
