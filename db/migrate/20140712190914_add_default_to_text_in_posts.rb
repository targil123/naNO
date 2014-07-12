class AddDefaultToTextInPosts < ActiveRecord::Migration
  def change
    change_column :posts, :text, :integer, default: 0
  end
end
