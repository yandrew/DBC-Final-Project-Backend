class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.float :offer_price
      t.belongs_to :user
      t.belongs_to :product
      t.integer :bid_id
      t.boolean :valid, default: true
      
      t.timestamps
    end
  end
end
