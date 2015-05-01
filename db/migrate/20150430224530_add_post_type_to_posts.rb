class AddPostTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :string
  end
end
