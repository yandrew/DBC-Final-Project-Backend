class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.boolean :transaction, default: false
      t.belongs_to :listing, index: true
      t.belongs_to :offer, index: true

      t.timestamps
    end
  end
end
