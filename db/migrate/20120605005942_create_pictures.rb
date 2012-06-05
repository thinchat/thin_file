class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :image
      t.timestamps
    end
  end
end
