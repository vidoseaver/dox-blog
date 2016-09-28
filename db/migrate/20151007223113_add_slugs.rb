class AddSlugs < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string
    add_column :pages, :slug, :string
    add_column :authors, :slug, :string

    add_index :articles, :slug, unique: true
    add_index :pages, :slug, unique: true
    add_index :authors, :slug, unique: true
  end
end
