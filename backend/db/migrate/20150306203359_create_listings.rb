class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :max_price
      t.integer :base_price
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
