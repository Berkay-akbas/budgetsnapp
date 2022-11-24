require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John', email: 'b@b.b', password: '123456') }
  let(:category) { Category.create(id: 1, name: 'Food', icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg', author_id: user.id) }
  let(:expense) { Expense.create(name: 'Food', amount: 100.00, author_id: user.id, category_id: 1) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is not valid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is not valid without a icon' do
      category.icon = nil
      expect(category).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many expenses' do
      assc = described_class.reflect_on_association(:expenses)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe 'Methods' do
    it 'should return the total expenses' do
      expect(category.total_expenses).to eq(0)
    end
  end
end
