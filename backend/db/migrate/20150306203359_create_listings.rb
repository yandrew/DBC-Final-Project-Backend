class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.float :max_price
      t.float :accept_price
      t.belongs_to :user
      t.belongs_to :product
      t.datetime :expires_at

      t.timestamps
    end
  end
end
