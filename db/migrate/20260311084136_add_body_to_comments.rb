class AddBodyToComments < ActiveRecord::Migration[8.1]
  def change
    add_column :comments, :body, :text
  end
end
