class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :expenses, foreign_key: 'category_id', dependent: :destroy
  validates :icon, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  def total_expenses
    expenses.sum(:amount)
  end
end
