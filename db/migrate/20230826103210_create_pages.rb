class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :about
      t.string :website
      t.string :phone
      t.string :whatsapp

      t.timestamps
    end
    add_index :pages, :name
    add_index :pages, :website
    add_index :pages, :phone
    add_index :pages, :whatsapp
  end
end
