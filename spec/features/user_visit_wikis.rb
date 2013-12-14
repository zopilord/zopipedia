require 'spec_helper'
	feature 'Guest visit a Wiki' do
	  scenario 'Visit a private Wiki' do
	  	user = FactoryGirl.create(:user)
	    visit new_user_session_path
	    fill_in  'Email', with: user.email
	    fill_in 'Password', with: user.password
	    click_button "Sign In"
	    expect(page).to have_content('Signed in successfully.')

		  visit new_wiki_path
	    fill_in  'Title', with: "First Private Wiki"
	    fill_in 'Body', with: "Body for Private Wiki"
	    check "Private"
	    click_button "Create Wiki"
	    expect(page).to have_content("You created a new private Wiki!")

	  	click_link "Log Out"  	
	  	visit wikis_path
	  	click_link "First Private Wiki"
	  	expect(page).to have_content("You need to be signed-in to see that wiki")
	  end
	end  	