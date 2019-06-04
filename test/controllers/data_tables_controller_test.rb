require 'test_helper'

class DataTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_table = data_tables(:one)
  end

  test "should get index" do
    get data_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_data_table_url
    assert_response :success
  end

  test "should create data_table" do
    assert_difference('DataTable.count') do
      post data_tables_url, params: { data_table: { title: @data_table.title } }
    end

    assert_redirected_to data_table_url(DataTable.last)
  end

  test "should show data_table" do
    get data_table_url(@data_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_table_url(@data_table)
    assert_response :success
  end

  test "should update data_table" do
    patch data_table_url(@data_table), params: { data_table: { title: @data_table.title } }
    assert_redirected_to data_table_url(@data_table)
  end

  test "should destroy data_table" do
    assert_difference('DataTable.count', -1) do
      delete data_table_url(@data_table)
    end

    assert_redirected_to data_tables_url
  end
end
