class AddTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :text, :integer
  end
end
