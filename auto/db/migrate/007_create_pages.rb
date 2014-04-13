class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :afType
      t.string :title
      t.string :code
      t.string :url
      t.boolean :isIndexPage
      t.string :layoutUrl
      t.belongs_to :pageConfig
      t.integer :lock_version
      t.timestamps
    end

    execute %{
      ALTER TABLE page_securities
      ADD CONSTRAINT fk_page_security
      FOREIGN KEY (page_id)
      REFERENCES pages (id)
      ON DELETE CASCADE;
    }

  end

  def self.down
    drop_table :pages
  end
end
