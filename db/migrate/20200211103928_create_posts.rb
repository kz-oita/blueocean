class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :text, null: false
      t.references :user
      t.timestamps
    end
  end
end
