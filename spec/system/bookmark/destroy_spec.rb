require 'rails_helper'

RSpec.describe "update bookmark", type: :system do
  let!(:bookmark) { Bookmark.create(title: "ruby with capybara", url: "www.rubyonrailscap.com") }

  scenario 'destry bookmark' do
    visit bookmark_path(bookmark.id)

    click_button 'Destroy this bookmark'

    sleep 1.seconds

    expect(page).to have_content("Bookmark was successfully destroyed")
  end
end