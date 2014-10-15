require 'rails_helper'

feature 'User edits wiki' do
  let(:wiki) { FactoryGirl.create(:wiki) }

  scenario 'Successfully' do
    visit wiki_path(wiki) 
    expect(page).to have_content("Edit wiki")
    click_link "Edit wiki"
    fill_in 'Body', with: 'Top 10 Asian destinations'
    click_button 'Save'
    expect(page).to have_content('Top 10 Asian destinations')
  end
end