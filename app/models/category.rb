class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :expenses, foreign_key: 'category_id', dependent: :destroy
  def total_expenses
    expenses.sum(:amount)
  end
end
