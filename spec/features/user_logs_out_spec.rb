require 'spec_helper'

feature 'User Sings in an then Logs Out' do
    scenario 'with valid email and password' do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in  'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button "Create User"
      expect(page).to have_content('Signed in successfully.')
      click_link "Logout"
      expect(page).to have_content("Signed out successfully.")
    end
end    