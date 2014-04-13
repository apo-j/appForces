class CreateAppData < ActiveRecord::Migration
  def self.up
    #table
    create_table :app_data, primary_key: :guid, options: 'auto_increment = 10000'  do |t|
      t.belongs_to :obj, class_name: 'MetaData'
      t.integer :org_id
      t.integer :node_type
      t.integer :order_num
      t.string :code
      t.boolean :is_active, null: false, default: false
      t.integer :lock_version
      t.timestamps
      for i in 1..500
        t.text "v#{i}"
      end
    end
    #index
    add_index :app_data, :org_id, name: :by_org
    add_index :app_data, :is_active, name: :by_active
    add_index :app_data, [:obj_id, :node_type], name: :by_obj_node_type
    #relationship
    execute %{
      ALTER TABLE app_data
      ADD CONSTRAINT fk_data_obj
      FOREIGN KEY (obj_id)
      REFERENCES meta_data (obj_id)
      ON DELETE CASCADE;
    }

  end

  def self.down
    drop_table :app_data
  end
end
