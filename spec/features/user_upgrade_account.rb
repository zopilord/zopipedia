require 'spec_helper'
#As a user with a premium account, I want to be able to create private wikis that require a Blocipedia account and proper authorization to view.

feature 'Pay with a credit card' do
  scenario 'with valid information' do
  	user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in  'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"
    expect(page).to have_content('Signed in successfully.')

    visit new_charge_path
    page.find(".stripe-button-el").click
    fill_in 'card_number', :with => '4000 0000 0000 0002'
    fill_in "card_code", with: "129"
    fill_in "cc-exp", with: "1016"
    expect(page).to have_content("This card was declined")
  end
end  
