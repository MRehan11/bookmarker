require 'rails_helper'

RSpec.describe "create bookmark", type: :system do
 
  scenario 'empty title and url' do
    visit new_bookmark_path
    click_button 'Create Bookmark'

    # The page should show error message 'Title can't be blank'
    # 'page' is a special variable from capybara, which contain information of the current displayed page
    expect(page).to have_content("Title can't be blank")

    #No bookmark record is created
    expect(Bookmark.count).to eq(0)
  end

  # happy path scenario block
  scenario 'valid title and url' do
    visit new_bookmark_path
    # fill in the text fields with specified strings
    fill_in "Title",	with: "new url" 
    fill_in "Url",	with: "https://raihan.com"
    click_button 'Create Bookmark'

    expect(page).to have_content("Bookmark was successfully created")
    expect(Bookmark.count).to eq(1)
  end

end