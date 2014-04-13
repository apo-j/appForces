class CreatePageConfigs < ActiveRecord::Migration
  def self.up
    create_table :page_configs do |t|
      t.string  :domainName
      t.integer :appId
      t.string  :appName
      t.string  :faviconUrl
      t.string  :appTouchFaviconUrl
      t.string  :styleId
      t.integer :languageId
      t.integer :lock_version
      t.timestamps
    end

    execute %{
      ALTER TABLE pages
      ADD CONSTRAINT fk_page
      FOREIGN KEY (pageConfig_id)
      REFERENCES page_configs (id)
      ON DELETE CASCADE;
    }

    add_index :page_configs, [:domainName, :appId], name: :by_dn_org

  end

  def self.down
    drop_table :page_configs
  end
end
