require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get microposts_index_url
    assert_response :success
  end

  test "should get create" do
    get microposts_create_url
    assert_response :success
  end

  test "should get show" do
    get microposts_show_url
    assert_response :success
  end

  test "should get destroy" do
    get microposts_destroy_url
    assert_response :success
  end

end
