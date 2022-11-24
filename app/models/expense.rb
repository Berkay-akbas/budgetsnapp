class Expense < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', optional: true
  belongs_to :category, foreign_key: 'category_id', optional: true
end
