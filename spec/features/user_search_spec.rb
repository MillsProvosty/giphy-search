require 'rails_helper'

describe "As a user on my dashboard page" do
  describe "I enter tiger in the search box, and click search, path should be q=tiger in the params" do
    it "I should see '5 Results', an id, url and gif " do
      # As a user
      #  When I visit "/"
      visit root_path
      expect(page).to have_button("Search")
      #  And I enter "tiger" in the search box
      #  and I click "Search"

      fill_in "q", with: "tiger"
      click_button 'Search'

      expect(current_path).to eq('/search')
      expect(current_url).to include("q=tiger")

      #  Then my path should be /search with "q=tiger" in the parameters
      #  And I should see "5 Results"
      expect(page).to have_content("5 Results")

      #  And I should see an id, a url, and the gif.
      within(page.all(".giphy_search_results")[0]) do
        expect(page).to have_xpath("//img[contains(@src,'something.jpg')]")
      end
    end
  end

end
