class HeroImages < ActiveRecord::Migration
  def change
    create_table :hero_images do |t|
      t.string :name
    end
  end
end
