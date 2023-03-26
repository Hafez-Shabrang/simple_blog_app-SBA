class AddUserIdAndPostId < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :integer
    add_column :users, :post_id, :integer
  end
end
