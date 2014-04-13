class CreateUiHeaders < ActiveRecord::Migration
  def self.up
    create_table :ui_headers do |t|
      t.integer :appId
      t.string :templateUrl
      t.string :css
      t.string :style
      t.integer :lock_version
      t.timestamps
    end

    execute %{
    ALTER TABLE ui_header_menus
    ADD CONSTRAINT fk_header_menu
    FOREIGN KEY (header_id)
    REFERENCES ui_headers (id)
    ON DELETE CASCADE;
    }

    execute %{
    ALTER TABLE ui_header_tops
    ADD CONSTRAINT fk_header_top
    FOREIGN KEY (header_id)
    REFERENCES ui_headers (id)
    ON DELETE CASCADE;
    }

    add_index :ui_headers, :appId, name: :by_org

  end

  def self.down
    drop_table :ui_headers
  end
end
