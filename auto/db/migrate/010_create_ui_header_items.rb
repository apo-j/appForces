class CreateUiHeaderItems < ActiveRecord::Migration
  def self.up
    create_table :ui_header_items do |t|
      t.string :name
      t.string :url
      t.string :imageUrl
      t.integer :lock_version
      t.belongs_to :item
      t.belongs_to :menu
      t.timestamps
    end
    execute %{
      ALTER TABLE ui_header_items
      ADD CONSTRAINT fk_header_item_1
      FOREIGN KEY (item_id)
      REFERENCES ui_header_items (id)
      ON DELETE CASCADE;
    }

  end

  def self.down
    drop_table :ui_header_items
  end
end
