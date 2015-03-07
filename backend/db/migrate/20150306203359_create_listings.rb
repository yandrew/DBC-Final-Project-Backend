class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :max_price
      t.integer :base_price
      t.belongs_to :user
      t.integer :product_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
