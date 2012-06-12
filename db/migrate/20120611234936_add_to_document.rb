class AddToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :user_id, :integer
    add_column :documents, :user_type, :string
    add_column :documents, :room_id, :integer
  end
end
