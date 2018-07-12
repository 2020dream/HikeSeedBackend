class AddOriginAndDateToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :origin_lat, :string
    add_column :hikes, :origin_lon, :string
    add_column :hikes, :date, :string
  end
end
