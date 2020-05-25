require 'rails_helper'

RSpec.feature 'Travels', type: :feature do
  let(:user) { create(:user) }
  let(:travel) { build(:travel) }
  scenario 'Does not create the article' do
    Category.create(name: 'Business travel', priority: 1)
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'Log In'

    visit 'travels/new'
    fill_in 'travel_title', with: travel.title
    fill_in 'travel_text', with: travel.text
    page.attach_file('travel_image', File.expand_path('./spec/images/example.jpg'))
    click_button 'Create Article'

    expect(page).to have_text('Fill in the required fields')
  end
end
