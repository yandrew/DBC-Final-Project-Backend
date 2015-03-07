class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :offer_price
      t.belongs_to :user
      t.integer :product_id
      t.integer :bid_id
      
      t.timestamps
    end
  end
end
