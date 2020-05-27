require 'rails_helper'

RSpec.feature 'Votes', type: :feature do
  let(:user) { create(:user) }
  let(:user_to_vote) { create(:user) }
  let(:travel) { build(:travel) }
  scenario 'Voting an article' do
    @category = Category.create(name: 'Business travel', priority: 1)
    travel.categories << @category

    visit '/login'
    fill_in 'name', with: user.name
    click_button 'Log In'

    visit 'travels/new'
    fill_in 'travel_title', with: travel.title
    fill_in 'travel_text', with: travel.text
    page.attach_file('travel_image', File.expand_path('./spec/images/example.jpg'))
    find('#checkbox1').click
    click_button 'Create Article'

    visit '/login'
    fill_in 'name', with: user_to_vote.name
    click_button 'Log In'

    visit '/categories/1'
    click_link 'Vote!'

    expect(page).to have_text('Successfully voted')
  end
end
