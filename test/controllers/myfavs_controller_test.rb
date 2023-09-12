require "test_helper"

class MyfavsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myfav = myfavs(:one)
  end

  test "should get index" do
    get myfavs_url
    assert_response :success
  end

  test "should get new" do
    get new_myfav_url
    assert_response :success
  end

  test "should create myfav" do
    assert_difference("Myfav.count") do
      post myfavs_url, params: { myfav: { tip_id: @myfav.tip_id, user_id: @myfav.user_id } }
    end

    assert_redirected_to myfav_url(Myfav.last)
  end

  test "should show myfav" do
    get myfav_url(@myfav)
    assert_response :success
  end

  test "should get edit" do
    get edit_myfav_url(@myfav)
    assert_response :success
  end

  test "should update myfav" do
    patch myfav_url(@myfav), params: { myfav: { tip_id: @myfav.tip_id, user_id: @myfav.user_id } }
    assert_redirected_to myfav_url(@myfav)
  end

  test "should destroy myfav" do
    assert_difference("Myfav.count", -1) do
      delete myfav_url(@myfav)
    end

    assert_redirected_to myfavs_url
  end
end
