require "application_system_test_case"

class FightsTest < ApplicationSystemTestCase
  setup do
    @fight = fights(:one)
  end

  test "visiting the index" do
    visit fights_url
    assert_selector "h1", text: "Fights"
  end

  test "creating a Fight" do
    visit fights_url
    click_on "New Fight"

    click_on "Create Fight"

    assert_text "Fight was successfully created"
    click_on "Back"
  end

  test "updating a Fight" do
    visit fights_url
    click_on "Edit", match: :first

    click_on "Update Fight"

    assert_text "Fight was successfully updated"
    click_on "Back"
  end

  test "destroying a Fight" do
    visit fights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fight was successfully destroyed"
  end
end
