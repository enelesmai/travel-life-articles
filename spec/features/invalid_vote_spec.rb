require 'rails_helper'

RSpec.feature 'Votes', type: :feature do
  scenario 'Can not vote an article twice' do
    @user1 = User.create(name: 'User1')
    @user2 = User.create(name: 'User2')

    @category = Category.new(name: 'Business travel', priority: 1)
    @category.save

    @travel = Travel.new(title: 'test travel article', text: @text, author_id: @user1.id, image: '/image.jpg')
    @travel.categories << @category

    @user1.save

    visit '/login'
    fill_in 'name', with: 'User2'
    click_button 'Log In'

    visit 'travels/new'
    @text = 'sja bkajsbkas ajsn jbdkasj' * 10
    fill_in 'travel_title', with: 'a title for the event'
    fill_in 'travel_text', with: @text
    page.attach_file('travel_image', File.expand_path('./spec/images/example.jpg'))
    find('#checkbox1').click
    click_button 'Create Article'

    visit '/login'
    fill_in 'name', with: 'User1'
    click_button 'Log In'

    visit '/categories/1'
    click_link 'Vote!'

    click_link 'Vote!'

    expect(page).to have_text('You already voted')
  end
end
