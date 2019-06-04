json.extract! data_table, :id, :title, :created_at, :updated_at
json.url data_table_url(data_table, format: :json)
