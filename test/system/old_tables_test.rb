require "application_system_test_case"

class OldTablesTest < ApplicationSystemTestCase
  setup do
    @old_table = old_tables(:one)
  end

  test "visiting the index" do
    visit old_tables_url
    assert_selector "h1", text: "Old Tables"
  end

  test "creating a Old table" do
    visit old_tables_url
    click_on "New Old Table"

    fill_in "Email", with: @old_table.email
    fill_in "Hometown", with: @old_table.hometown
    fill_in "Name", with: @old_table.name
    fill_in "Title", with: @old_table.title
    fill_in "Username", with: @old_table.username
    click_on "Create Old table"

    assert_text "Old table was successfully created"
    click_on "Back"
  end

  test "updating a Old table" do
    visit old_tables_url
    click_on "Edit", match: :first

    fill_in "Email", with: @old_table.email
    fill_in "Hometown", with: @old_table.hometown
    fill_in "Name", with: @old_table.name
    fill_in "Title", with: @old_table.title
    fill_in "Username", with: @old_table.username
    click_on "Update Old table"

    assert_text "Old table was successfully updated"
    click_on "Back"
  end

  test "destroying a Old table" do
    visit old_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Old table was successfully destroyed"
  end
end
