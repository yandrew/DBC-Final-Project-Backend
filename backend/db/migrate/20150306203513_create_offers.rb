class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.float :offer_price
      #t.integer :user_id
      #t.integer :listing_id
      t.belongs_to :user
      t.belongs_to :rating
      t.belongs_to :listing
      t.boolean :valid, default: true
      t.boolean :purchased, default: false
      
      t.timestamps
    end
  end
end
