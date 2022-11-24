class AddUserToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :author, foreign_key: { to_table: :users }, on_delete: :cascade
  end
end
