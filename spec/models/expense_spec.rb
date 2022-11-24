require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'John', email: 'j@j.j', password: '123456') }
  let(:category) { Category.create(name: 'Food', icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg', author_id: user.id) }
  let(:expense) { Expense.create(name: 'Food', amount: 100.00, author_id: user.id, category_id: category.id) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(expense).to be_valid
    end

    it 'is not valid without a name' do
      expense.name = nil
      expect(expense).to_not be_valid
    end

    it 'is not valid without a amount' do
      expense.amount = nil
      expect(expense).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to category' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
