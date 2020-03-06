class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :message, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
