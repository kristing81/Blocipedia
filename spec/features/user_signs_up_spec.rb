require 'rails_helper'

feature 'User signs up for Blocipedia' do
  scenario 'Successfully' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    click_button 'Sign up'
    expect(page).to have_content("Blocipedia")
  end
end


#As a user, I should be able to sign up for a 
#free account by providing a user name, password and email address.