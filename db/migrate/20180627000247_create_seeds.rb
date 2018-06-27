class CreateSeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :seeds do |t|
      t.string :nickname
      t.references :hike, foreign_key: true

      t.timestamps
    end
  end
end
