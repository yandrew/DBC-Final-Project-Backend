class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.json :image

      t.timestamps
    end
  end
end
