class Expense < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', optional: true
  belongs_to :category, foreign_key: 'category_id', optional: true
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
