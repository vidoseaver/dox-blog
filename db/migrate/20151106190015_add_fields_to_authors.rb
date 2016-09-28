class AddFieldsToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :about, :text, after: :active
    add_column :authors, :twitter, :string, after: :active
  end
end
