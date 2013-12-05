require 'spec_helper'

feature 'Creates Wiki' do
  scenario 'with a body an a title' do
    wiki = FactoryGirl.create(:wiki)
    visit new_wiki_path
    fill_in  'Title', with: wiki.title
    fill_in 'Body', with: wiki.body
    click_button "Create Wiki"
    expect(page).to have_content("Wiki was Saved!")
  end
end  
