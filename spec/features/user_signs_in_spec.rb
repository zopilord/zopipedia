require 'spec_helper'

feature 'User signs in' do
    scenario 'with valid email and password' do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in  'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button "Sign In"
      expect(page).to have_content('Signed in successfully.')
    end

    scenario "with invalid email" do
    	user = FactoryGirl.create(:user)
    	visit new_user_session_path
    	fill_in 'Email', with: "user@test.com"
    	fill_in 'Password', with: user.password
    	click_button 'Sign In'
    	expect(page).to have_content("Invalid email or password.")
    end
    
    scenario "with invalid password" do
    	user = FactoryGirl.create(:user)
    	visit new_user_session_path
    	fill_in 'Email', with: user.email
    	fill_in 'Password', with: "fooobar"
    	click_button 'Sign In'
    	expect(page).to have_content("Invalid email or password.")	
    end

    scenario "with blank password and email" do
    	user = FactoryGirl.create(:user)
    	visit new_user_session_path
    	fill_in 'Email', with: ""
    	fill_in 'Password', with: ""
    	click_button 'Sign In'
    	expect(page).to have_content("Invalid email or password.")	
    end

end     

