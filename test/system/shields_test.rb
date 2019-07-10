require "application_system_test_case"

class ShieldsTest < ApplicationSystemTestCase
  setup do
    @shield = shields(:one)
  end

  test "visiting the index" do
    visit shields_url
    assert_selector "h1", text: "Shields"
  end

  test "creating a Shield" do
    visit shields_url
    click_on "New Shield"

    click_on "Create Shield"

    assert_text "Shield was successfully created"
    click_on "Back"
  end

  test "updating a Shield" do
    visit shields_url
    click_on "Edit", match: :first

    click_on "Update Shield"

    assert_text "Shield was successfully updated"
    click_on "Back"
  end

  test "destroying a Shield" do
    visit shields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shield was successfully destroyed"
  end
end
