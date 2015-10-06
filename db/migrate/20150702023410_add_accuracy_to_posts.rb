class AddAccuracyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :accuracy, :integer
  end
end
