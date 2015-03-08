class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :max_price
      t.integer :accept_price
      t.belongs_to :user
      t.belongs_to :product
      t.datetime :expires_at

      t.timestamps
    end
  end
end
