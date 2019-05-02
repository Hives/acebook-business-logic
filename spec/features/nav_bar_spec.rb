# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Nav bar", type: :feature do
  describe "'My wall'" do
    scenario "Logged in users should see a link to their wall" do
      sign_up
      expect(page).to have_link("My wall")
    end

    scenario "'My wall' link should go to posts page" do
      sign_up username: "user"
      click_link("My wall")
      expect(current_path).to eq "/user"
    end

    scenario "Logged out users do not see 'My wall'sposts link" do
      visit "/"
      expect(page).not_to have_link("My wall")
    end
  end

  describe "'Log in'" do
    scenario "Logged out users should see a log in link" do
      visit "/"
      expect(page).to have_link("Log in")
    end

    scenario "'Log in' link should go to login page" do
      visit "/"
      click_link("Log in")
      expect(current_path).to eq "/login"
    end

    scenario "Logged in users do not see 'log in' link" do
      sign_up
      expect(page).not_to have_link("Log in")
    end
  end

  describe "'Log out'" do
    scenario "Logged in users should see a 'log out' link" do
      sign_up
      expect(page).to have_link("Log out")
    end

    scenario "Logged out users should not see a 'log out'" do
      visit "/"
      expect(page).not_to have_link("Log out")
    end
  end
end
