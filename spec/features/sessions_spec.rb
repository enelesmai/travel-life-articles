require 'rails_helper'

RSpec.feature 'Session Authentication', type: :feature do
  let(:user) { create(:user) }
  scenario 'Valid User login' do
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'Log In'

    expect(page).to have_text('Logged in')
  end
  scenario 'Invalid User login' do
    visit '/login'
    fill_in 'name', with: 'selene'
    click_button 'Log In'

    expect(page).to have_text('Username is not valid')
  end
end
