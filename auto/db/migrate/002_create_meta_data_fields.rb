class CreateMetaDataFields < ActiveRecord::Migration
  def self.up
    #table
    create_table :meta_data_fields, primary_key: :field_id do |t|
      t.belongs_to :obj, class_name: 'MetaData'
      t.integer :org_id
      t.string :field_name
      t.integer :field_num
      t.integer :field_type
      t.boolean :is_indexed, null: false, default: false
      t.boolean :is_unique, null: false, default: false
      t.integer :lock_version
      t.timestamps
    end
    #index
    add_index :meta_data_fields, :org_id, name: :by_org
    add_index :meta_data_fields, [:obj_id, :is_indexed], name: :by_obj_index
    #relationship
    execute %{
      ALTER TABLE meta_data_fields
      ADD CONSTRAINT fk_field_obj
      FOREIGN KEY (obj_id)
      REFERENCES meta_data (obj_id)
      ON DELETE CASCADE;
    }
  end

  def self.down
    drop_table :meta_data_fields
  end
end
