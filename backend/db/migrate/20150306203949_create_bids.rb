class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.boolean :transaction, default: false
      t.references :listing, index: true
      t.references :offer, index: true

      t.timestamps
    end
  end
end
