require "application_system_test_case"

class CreatorsTest < ApplicationSystemTestCase
  setup do
    @creator = creators(:one)
  end

  test "visiting the index" do
    visit creators_url
    assert_selector "h1", text: "Creators"
  end

  test "should create creator" do
    visit creators_url
    click_on "New creator"

    fill_in "Name", with: @creator.name
    fill_in "Nationality", with: @creator.nationality
    click_on "Create Creator"

    assert_text "Creator was successfully created"
    click_on "Back"
  end

  test "should update Creator" do
    visit creator_url(@creator)
    click_on "Edit this creator", match: :first

    fill_in "Name", with: @creator.name
    fill_in "Nationality", with: @creator.nationality
    click_on "Update Creator"

    assert_text "Creator was successfully updated"
    click_on "Back"
  end

  test "should destroy Creator" do
    visit creator_url(@creator)
    click_on "Destroy this creator", match: :first

    assert_text "Creator was successfully destroyed"
  end
end
