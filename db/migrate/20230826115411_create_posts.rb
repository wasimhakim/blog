class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :page
      t.references :user

      t.timestamps
    end
    add_index :posts, :title
  end
end
