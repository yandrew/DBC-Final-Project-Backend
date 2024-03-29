class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :name
      t.string :email
      t.text :avatar
      t.text :bio
      t.integer :rating, default: nil

      t.timestamps
    end
  end
end
