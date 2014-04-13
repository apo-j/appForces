class CreateUiHeaderMenus < ActiveRecord::Migration
  def self.up
    create_table :ui_header_menus do |t|
      t.string :templateUrl
      t.string :navbarUrl
      t.belongs_to :header
      t.integer :lock_version
      t.timestamps
    end

    execute %{
    ALTER TABLE ui_header_items
    ADD CONSTRAINT fk_header_item_2
    FOREIGN KEY (menu_id)
    REFERENCES ui_header_menus (id)
    ON DELETE CASCADE;
    }

  end

  def self.down
    drop_table :ui_header_menus
  end
end
