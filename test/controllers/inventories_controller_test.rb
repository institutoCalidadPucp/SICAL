require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inventories_new_url
    assert_response :success
  end

end
