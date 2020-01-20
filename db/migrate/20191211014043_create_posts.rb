class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :industry
      t.string :hopejob
      t.string :nowjob
      t.text :text, null: false, :limit => 16777215
      t.references :user, foreign_key: true
      t.boolean :solved, default: false, null: false
      t.timestamps
    end
  end
end
