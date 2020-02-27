require "application_system_test_case"

class PhTest < ApplicationSystemTestCase
  setup do
    @ph = ph(:one)
  end

  test "visiting the index" do
    visit ph_url
    assert_selector "h1", text: "Ph"
  end

  test "creating a Ph" do
    visit ph_url
    click_on "New Ph"

    fill_in "Measure", with: @ph.measure
    click_on "Create Ph"

    assert_text "Ph was successfully created"
    click_on "Back"
  end

  test "updating a Ph" do
    visit ph_url
    click_on "Edit", match: :first

    fill_in "Measure", with: @ph.measure
    click_on "Update Ph"

    assert_text "Ph was successfully updated"
    click_on "Back"
  end

  test "destroying a Ph" do
    visit ph_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ph was successfully destroyed"
  end
end
