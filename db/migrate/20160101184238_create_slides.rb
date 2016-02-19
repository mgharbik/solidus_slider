class CreateSlides < ActiveRecord::Migration
  def change
    create_table :spree_slides do |t|
      t.string :name
      t.text :body
      t.string :link_url
      t.boolean :published, null: false, default: false
      t.integer :position, null: false, default: 0
      t.belongs_to :product, index: true
      t.belongs_to :slide_location, index: true

      t.timestamps null: false
    end
  end
end
