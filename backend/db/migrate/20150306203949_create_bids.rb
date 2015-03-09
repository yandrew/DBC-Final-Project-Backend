class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.boolean :purchased, default: false
      t.belongs_to :listing
      t.integer :offer_id
      t.boolean :invalid, default: false

      t.timestamps
    end
  end
end
