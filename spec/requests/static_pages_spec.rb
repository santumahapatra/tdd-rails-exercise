require 'spec_helper'

describe "StaticPages" do
  describe "Search Page" do
    it "get returns the searchpage" do
      get root_path
      response.status.should be(200)
    end

    it "has the right content" do
      visit root_path
      expect(page).to have_content 'Search'
    end

    it "submitting the form takes to search page" do
      visit root_path
      fillup_form
      click_button "Search"
      expect(page).to have_content 'searching'
    end
  end
end
