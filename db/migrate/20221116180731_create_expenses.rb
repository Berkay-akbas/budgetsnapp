class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.timestamps
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
    end
  end
end
