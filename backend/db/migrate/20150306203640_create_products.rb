class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :image_url
      t.text :description
      t.string :condition
      t.references :user, index: true
      t.references :listing, index: true
      t.references :offer, index: true

      t.timestamps
    end
  end
end
