require 'test_helper'

class OldTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @old_table = old_tables(:one)
  end

  test "should get index" do
    get old_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_old_table_url
    assert_response :success
  end

  test "should create old_table" do
    assert_difference('OldTable.count') do
      post old_tables_url, params: { old_table: { email: @old_table.email, hometown: @old_table.hometown, name: @old_table.name, title: @old_table.title, username: @old_table.username } }
    end

    assert_redirected_to old_table_url(OldTable.last)
  end

  test "should show old_table" do
    get old_table_url(@old_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_old_table_url(@old_table)
    assert_response :success
  end

  test "should update old_table" do
    patch old_table_url(@old_table), params: { old_table: { email: @old_table.email, hometown: @old_table.hometown, name: @old_table.name, title: @old_table.title, username: @old_table.username } }
    assert_redirected_to old_table_url(@old_table)
  end

  test "should destroy old_table" do
    assert_difference('OldTable.count', -1) do
      delete old_table_url(@old_table)
    end

    assert_redirected_to old_tables_url
  end
end
