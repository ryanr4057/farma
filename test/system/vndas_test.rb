require "application_system_test_case"

class VndasTest < ApplicationSystemTestCase
  setup do
    @vnda = vndas(:one)
  end

  test "visiting the index" do
    visit vndas_url
    assert_selector "h1", text: "Vndas"
  end

  test "should create vnda" do
    visit vndas_url
    click_on "New vnda"

    click_on "Create Vnda"

    assert_text "Vnda was successfully created"
    click_on "Back"
  end

  test "should update Vnda" do
    visit vnda_url(@vnda)
    click_on "Edit this vnda", match: :first

    click_on "Update Vnda"

    assert_text "Vnda was successfully updated"
    click_on "Back"
  end

  test "should destroy Vnda" do
    visit vnda_url(@vnda)
    click_on "Destroy this vnda", match: :first

    assert_text "Vnda was successfully destroyed"
  end
end
