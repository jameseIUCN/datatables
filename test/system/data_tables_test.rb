require "application_system_test_case"

class DataTablesTest < ApplicationSystemTestCase
  setup do
    @data_table = data_tables(:one)
  end

  test "visiting the index" do
    visit data_tables_url
    assert_selector "h1", text: "Data Tables"
  end

  test "creating a Data table" do
    visit data_tables_url
    click_on "New Data Table"

    fill_in "Title", with: @data_table.title
    click_on "Create Data table"

    assert_text "Data table was successfully created"
    click_on "Back"
  end

  test "updating a Data table" do
    visit data_tables_url
    click_on "Edit", match: :first

    fill_in "Title", with: @data_table.title
    click_on "Update Data table"

    assert_text "Data table was successfully updated"
    click_on "Back"
  end

  test "destroying a Data table" do
    visit data_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data table was successfully destroyed"
  end
end
