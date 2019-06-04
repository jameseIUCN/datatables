class NewFieldsToDataTables < ActiveRecord::Migration[5.2]
  def change
    change_table :data_tables do |t|
      t.string :username
      t.string :name  
      t.string :email    
      t.string :hometown
    end
  end
end
