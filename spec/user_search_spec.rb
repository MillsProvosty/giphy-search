require 'rails_helper'

RSpec.describe "As a user on my dashboard page" do
  describe "I enter tiger in the search box, and click search, path should be q=tiger in the params" do
    scenario "I shoulid see '5 Results', an id, url and gif "
    visit "/"

    expect(page).to have_button("Search")

    fill_in :search, with: "tiger"
    click_button 'Search'

    expect(current_path).to eq("/q=tiger")

    expect(page).to have_content("5 Results")

    within(page.all(".giphy_search_results")[0]) do
      expect(page).to have_xpath("//img[contains(@src,'something.jpg')]")
    end

  end
end
