require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get author" do
    get static_pages_author_url
    assert_response :success
  end

  test "should get icons" do
    get static_pages_icons_url
    assert_response :success
  end

  test "should get tech_stack" do
    get static_pages_tech_stack_url
    assert_response :success
  end
end
