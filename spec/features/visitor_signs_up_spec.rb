require 'spec_helper'

feature 'User signs up' do
    scenario 'with valid email and password' do
        sign_up_with 'user@example.com', 'password'
        expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    scenario 'whith invalid email' do
      sign_up_with " ", "password"
      expect(page).to have_content("Email can't be blank")
    end  
    
    scenario "with invalid short password" do
      sign_up_with "user@example.com", "foobar"
      expect(page).to have_content("Password is too short (minimum is 8 characters)")
    end
    
    scenario "with invalid blank password" do
      sign_up_with "user@example.com", ""
      expect(page).to have_content("Password can't be blank")
    end  
    
    def sign_up_with(email, password)
        visit new_user_registration_path
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
        click_button 'Create User'
    end
end
