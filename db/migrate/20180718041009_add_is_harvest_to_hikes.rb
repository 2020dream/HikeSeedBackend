class AddIsHarvestToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :is_harvest, :boolean, default: false
  end
end
