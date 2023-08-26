class AddUserToPage < ActiveRecord::Migration[7.0]
  def change
    add_reference :pages, :user
  end
end
