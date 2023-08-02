require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get b2b" do
    get pages_b2b_url
    assert_response :success
  end

  test "should get history" do
    get pages_history_url
    assert_response :success
  end

  test "should get profile" do
    get pages_profile_url
    assert_response :success
  end

  test "should get login" do
    get pages_login_url
    assert_response :success
  end

  test "should get signup" do
    get pages_signup_url
    assert_response :success
  end
end
