class AddPostalCodeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :postal_code, :string
  end
end
