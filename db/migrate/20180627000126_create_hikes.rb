class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :lat
      t.string :lon
      t.float :distance

      t.timestamps
    end
  end
end
