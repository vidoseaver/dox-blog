class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
