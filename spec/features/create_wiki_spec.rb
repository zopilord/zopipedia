require 'spec_helper'

#As a user, I want to be able to create wiki pages using Markdown syntax.
feature 'Creates Wiki' do
  scenario 'Private with a Body an a Title' do
  	user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in  'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"
    expect(page).to have_content('Signed in successfully.')

    visit new_wiki_path
    fill_in  'Title', with: "First Wiki"
    fill_in 'Body', with: "Body for Wiki"
    check 'Private'
    click_button "Create Wiki"
    expect(page).to have_content("You created a new private Wiki!")
  end

  scenario "Public with a Body an a Title" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in  'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"
    expect(page).to have_content('Signed in successfully.')

    visit new_wiki_path
    fill_in  'Title', with: "First Wiki"
    fill_in 'Body', with: "Body for Wiki"
    click_button "Create Wiki"
    expect(page).to have_content("You created a new public Wiki!")
  end  
end  
