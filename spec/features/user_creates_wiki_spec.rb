require 'rails_helper'

feature 'User creates wiki' do
  
  scenario 'Successfully' do
    visit new_wiki_path
    expect(page).to have_content("Add your wiki")
    fill_in 'Title', with: 'Travel'
    fill_in 'Body', with: 'Top 10 destinations'
    click_button 'Save'
    expect(page).to have_content('Travel')
    expect(page).to have_content('Top 10 destinations')
  end
end