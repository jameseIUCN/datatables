json.extract! old_table, :id, :title, :name, :username, :email, :hometown, :created_at, :updated_at
json.url old_table_url(old_table, format: :json)
