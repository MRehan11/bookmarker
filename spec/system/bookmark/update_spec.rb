require 'rails_helper'

RSpec.describe "update bookmark", type: :system do

  # this will create a 'bookmark' before each scenario is run
  let!(:bookmark) { Bookmark.create(title: "ruby with capybara", url: "www.rubyonrailscap.com") }

  # empty title and url scenario
  scenario ' empty url and title' do
    visit bookmark_path(bookmark.id)

    # click the link that has the text 'edit'
    click_link 'Edit this bookmark'

    # fill the fields with empty strings
    fill_in "Title",	with: ''
    fill_in "Url",	with: ''

    click_button 'Update Bookmark'

    expect(page).to have_content("Title can't be blank")

    # the bookmark title should not be changed
    expect(bookmark.reload.title).to eq('ruby with capybara')
  end

  # with valid title and url
  scenario 'valid title and url' do
    visit bookmark_path(bookmark.id)

    click_link 'Edit this bookmark'

    fill_in "Title",	with: "Ruby with rspec"
    fill_in "Url",	with: "www.rubyrspec.com"

    click_button 'Update Bookmark'

    expect(page).to have_content('Bookmark was successfully updated')

    expect(bookmark.reload.url).to eq('www.rubyrspec.com')
  end

end