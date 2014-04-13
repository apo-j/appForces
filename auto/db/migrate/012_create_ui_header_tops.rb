class CreateUiHeaderTops < ActiveRecord::Migration
  def self.up
    create_table :ui_header_tops do |t|
      t.string :style
      t.string :css
      t.string :templateUrl
      t.integer :lock_version
      t.belongs_to :header
      t.timestamps
    end
  end

  def self.down
    drop_table :ui_header_tops
  end
end
