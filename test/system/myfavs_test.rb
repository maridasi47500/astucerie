require "application_system_test_case"

class MyfavsTest < ApplicationSystemTestCase
  setup do
    @myfav = myfavs(:one)
  end

  test "visiting the index" do
    visit myfavs_url
    assert_selector "h1", text: "Myfavs"
  end

  test "should create myfav" do
    visit myfavs_url
    click_on "New myfav"

    fill_in "Tip", with: @myfav.tip_id
    fill_in "User", with: @myfav.user_id
    click_on "Create Myfav"

    assert_text "Myfav was successfully created"
    click_on "Back"
  end

  test "should update Myfav" do
    visit myfav_url(@myfav)
    click_on "Edit this myfav", match: :first

    fill_in "Tip", with: @myfav.tip_id
    fill_in "User", with: @myfav.user_id
    click_on "Update Myfav"

    assert_text "Myfav was successfully updated"
    click_on "Back"
  end

  test "should destroy Myfav" do
    visit myfav_url(@myfav)
    click_on "Destroy this myfav", match: :first

    assert_text "Myfav was successfully destroyed"
  end
end
