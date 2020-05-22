require 'rails_helper'

RSpec.feature 'Session Authentication', type: :feature do
  scenario 'Valid User login' do
    @user = User.new(name: 'User')
    @user.save
    visit '/login'
    fill_in 'name', with: 'User'
    click_button 'Log In'

    expect(page).to have_text('Logged in')
  end
  scenario 'Invalid User login' do
    @user = User.new(name: 'User')
    @user.save
    visit '/login'
    fill_in 'name', with: 'selene'
    click_button 'Log In'

    expect(page).to have_text('Username is not valid')
  end
end
