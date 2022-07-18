require 'rails_helper'

RSpec.describe "update bookmark", type: :system do
  let!(:bookmark) { Bookmark.create(title: "ruby with capybara", url: "www.rubyonrailscap.com") }

  scenario 'will show the bookmark' do
    visit bookmark_path(bookmark.id)

    sleep 1.seconds
    expect(page).to have_content("ruby with capybara")
  end

end