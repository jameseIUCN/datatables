class CreateDataTables < ActiveRecord::Migration[5.2]
  def change
    create_table :data_tables do |t|
      t.string :title

      t.timestamps
    end
  end
end
