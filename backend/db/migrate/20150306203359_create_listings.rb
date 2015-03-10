class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.float :max_price
      t.float :accept_price, default: 0
      t.belongs_to :user
      t.datetime :expires_at
      t.belongs_to :rating
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
