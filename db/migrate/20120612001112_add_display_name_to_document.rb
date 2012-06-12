class AddDisplayNameToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :user_display_name, :string
  end
end
