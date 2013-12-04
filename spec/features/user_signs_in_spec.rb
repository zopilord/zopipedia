require 'spec_helper'

feature 'User signs in' do
    scenario 'with valid email and password' do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in  'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button "Create User"
      expect(page).to have_content('Signed in successfully.')
    end
    
end     