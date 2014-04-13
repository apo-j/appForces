class CreatePageSecurities < ActiveRecord::Migration
  def self.up
    create_table :page_securities do |t|
      t.boolean :requireLogin
      t.string :token
      t.belongs_to :page
      t.integer :lock_version
      t.timestamps
    end


  end

  def self.down
    drop_table :page_securities
  end
end
