class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :offer_price
      t.belongs_to :user, index: true
      t.integer :product_id
      
      t.timestamps
    end
  end
end
