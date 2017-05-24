require 'test_helper'

class RoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get role_index_url
    assert_response :success
  end

  test "should get new" do
    get role_new_url
    assert_response :success
  end

  test "should get create" do
    get role_create_url
    assert_response :success
  end

  test "should get edit" do
    get role_edit_url
    assert_response :success
  end

  test "should get update" do
    get role_update_url
    assert_response :success
  end

  test "should get delete" do
    get role_delete_url
    assert_response :success
  end

end
