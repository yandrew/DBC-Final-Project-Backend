class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content

      t.belongs_to :user
      t.belongs_to :listing
      t.belongs_to :offer

      t.timestamps
    end
  end
end
