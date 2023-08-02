require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registration_index_url
    assert_response :success
  end

  test "should get personal" do
    get registration_personal_url
    assert_response :success
  end

  test "should get address" do
    get registration_address_url
    assert_response :success
  end

  test "should get official" do
    get registration_official_url
    assert_response :success
  end
end
