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
      expect(page).to have_content 'Loading.....'
    end

    it "submitting the form takes to results page" do
      visit root_path
      fillup_form
      click_button "Search"
      expect(page).to have_content 'Results'
    end
  end
end
