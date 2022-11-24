require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'John', email: 'j@j.j', password: '123456') }
  let(:category) { Category.create(name: 'Food', icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg', author_id: user.id) }
  let(:expense) { Expense.create(name: 'Food', amount: 100.00, author_id: user.id, category_id: category.id) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many categories' do
      assc = described_class.reflect_on_association(:categories)
      expect(assc.macro).to eq :has_many
    end

    it 'has many expenses' do
      assc = described_class.reflect_on_association(:expenses)
      expect(assc.macro).to eq :has_many
    end
  end
end
