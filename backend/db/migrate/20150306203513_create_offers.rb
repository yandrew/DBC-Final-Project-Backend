class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :offer_price
      t.references :user, index: true

      t.timestamps
    end
  end
end