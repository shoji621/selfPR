class AddIndexToPosts < ActiveRecord::Migration[5.0]
  def change
    add_index :posts,  :text, length: 200
  end
end
