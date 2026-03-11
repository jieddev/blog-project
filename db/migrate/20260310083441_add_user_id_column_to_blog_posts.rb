class AddUserIdColumnToBlogPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :blog_posts, :user_id, :bigint
  end
end
