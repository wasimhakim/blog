require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  setup do
    @page = pages(:one)
  end

  test "visiting the index" do
    visit pages_url
    assert_selector "h1", text: "Pages"
  end

  test "should create page" do
    visit pages_url
    click_on "New page"

    fill_in "About", with: @page.about
    fill_in "Name", with: @page.name
    fill_in "Phone", with: @page.phone
    fill_in "Website", with: @page.website
    fill_in "Whatsapp", with: @page.whatsapp
    click_on "Create Page"

    assert_text "Page was successfully created"
    click_on "Back"
  end

  test "should update Page" do
    visit page_url(@page)
    click_on "Edit this page", match: :first

    fill_in "About", with: @page.about
    fill_in "Name", with: @page.name
    fill_in "Phone", with: @page.phone
    fill_in "Website", with: @page.website
    fill_in "Whatsapp", with: @page.whatsapp
    click_on "Update Page"

    assert_text "Page was successfully updated"
    click_on "Back"
  end

  test "should destroy Page" do
    visit page_url(@page)
    click_on "Destroy this page", match: :first

    assert_text "Page was successfully destroyed"
  end
end