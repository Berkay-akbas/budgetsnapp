class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, dependent: :destroy, foreign_key: 'user_id'
  has_many :categories, dependent: :destroy, foreign_key: 'author_id'
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, length: { minimum: 3, maximum: 25 }
  validates :password, presence: true, length: { minimum: 3, maximum: 25 }
end
