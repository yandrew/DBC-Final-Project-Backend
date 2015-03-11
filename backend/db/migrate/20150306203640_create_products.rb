class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :image_url
      t.text :description
      t.string :condition
      #t.integer :user_id
      #t.integer :listing_id
      #t.integer :offer_id
      #t.integer :category_id

      t.belongs_to :user
      t.belongs_to :category
      t.belongs_to :listing
      t.belongs_to :offer

      t.timestamps
    end
  end
end
