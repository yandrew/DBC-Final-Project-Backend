class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :max_price
      t.integer :base_price
      t.references :user, index: true

      t.timestamps
    end
  end
end
