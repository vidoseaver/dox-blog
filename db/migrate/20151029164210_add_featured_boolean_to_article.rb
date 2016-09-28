class AddFeaturedBooleanToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :featured, :boolean, default: false, after: :title
    add_column :articles, :subtitle, :string
    add_column :articles, :hero_image_name, :string
    add_index :articles, :featured

    add_column :pages, :featured, :boolean, default: false, after: :title
    add_column :pages, :hero_image_name, :string
    add_column :pages, :subtitle, :string
    add_index :pages, :featured
  end
end
