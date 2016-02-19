class CreateSlideLocations < ActiveRecord::Migration
  def change
    create_table :spree_slide_locations do |t|
      t.string :name
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end