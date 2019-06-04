class CreateOldTables < ActiveRecord::Migration[5.2]
  def change
    create_table :old_tables do |t|
      t.string :title
      t.string :name
      t.string :username
      t.string :email
      t.string :hometown

      t.timestamps
    end
  end
end
