class CreateMetaData < ActiveRecord::Migration
  def self.up
    #table
    create_table :meta_data, primary_key: :obj_id, options:'auto_increment = 1000' do |t|
      t.integer :org_id
      t.string :obj_name
      t.boolean :is_active, null: false, default: false
      t.integer :lock_version
      t.timestamps
    end
    #index
    add_index :meta_data, :org_id, name: :by_org
    add_index :meta_data, :is_active, name: :by_active
    add_index :meta_data, [:org_id, :obj_name], unique: true, name: :by_org_name
  end

  def self.down
    drop_table :meta_data
  end
end
