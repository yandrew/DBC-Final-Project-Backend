class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.text :description
      t.integer :author_id
      t.integer :recipient_id
      t.belongs_to :bid

      t.timestamps
    end
  end
end
