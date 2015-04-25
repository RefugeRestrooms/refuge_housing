class AddNewColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :name, :text
  end
end
