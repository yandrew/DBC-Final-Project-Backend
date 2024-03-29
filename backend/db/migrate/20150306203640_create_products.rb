class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :image_url
      t.text :description
      t.string :condition
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
