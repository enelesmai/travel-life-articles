require 'rails_helper'

RSpec.feature 'Travels', type: :feature do
  let(:user) { create(:user) }
  let(:travel) { build(:travel) }
  scenario 'Create a new travelling article' do
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'Log In'

    Category.create(name: 'Bussiness Travel', priority: 1)

    visit 'travels/new'
    fill_in 'travel_title', with: travel.title
    fill_in 'travel_text', with: travel.text
    page.attach_file('travel_image', File.expand_path('./spec/images/example.jpg'))
    find('#checkbox1').click
    click_button 'Create Article'

    expect(page).to have_text('Traveling article created successfully')
  end
end
