require 'test_helper'

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
	setup do
    @laboratory = laboratories(:one)
  end

	test "should get laboratory index" do
		get laboratories_url
		assert_response :success
	end	

	test "should get laboratory new" do
		get new_laboratory_url
		assert_response :success
	end

	test "should get laboratory edit" do
		get edit_laboratory_url(@laboratory)
		assert_response :success
	end

	test "should create laboratory" do
		assert_difference('Laboratory.count') do
			post laboratories_url, params: { laboratory: {name: 'lala', phone: '1234567', email: 'lala@pucp.pe'}}
		end
		assert_redirected_to laboratories_path
	end
end