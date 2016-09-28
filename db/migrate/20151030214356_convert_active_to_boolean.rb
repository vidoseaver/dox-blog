class ConvertActiveToBoolean < ActiveRecord::Migration
  def up
    remove_column :authors, :active, :string
    add_column :authors, :active, :boolean, default: true, after: :email
  end

  def down
    add_column :authors, :active, :string
    remove_column :authors, :active, :boolean, default: true, after: :email
  end
end
