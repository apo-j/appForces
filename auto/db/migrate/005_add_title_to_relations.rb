class AddTitleToRelations < ActiveRecord::Migration
  def self.up
    add_column :relationships, :title, :string
    add_index  :relationships, [:org_id, :title], unique: true, name: :by_org_title
  end

  def self.down
  end
end
