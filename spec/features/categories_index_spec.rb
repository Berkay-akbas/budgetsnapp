require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Category', type: :request do
  subject { page }
  before(:each) do
    User.create!(name: 'John', email: 'j@j.j', password: '123456', id: 1)
    Category.create!(name: 'Clothes', icon: 'https://www.flaticon.com/svg/static/icons/svg/3144/3144456.svg',
                     author_id: 1, id: 1)
    Expense.create!(name: 'Food', amount: 100.00, author_id: 1, category_id: 1)
  end

  it 'renders the page' do
    get categories_path
    expect(response.body).to include('You')
  end
end
