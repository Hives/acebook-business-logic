# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe ".search_emails_and_usernames" do
    it "results include a user if the exact username is searched for" do
      user = User.create(email: "arthur@gmail.com", username: "arthur", password: "password")
      results = User.search_emails_and_usernames("arthur")
      expect(results).to include(user)
    end
  end

  describe ".search_emails_and_usernames" do
    it "results do not include a user if the search term doesn't match the username" do
      user = User.create(email: "arthur@gmail.com", username: "arthur", password: "password")
      results = User.search_emails_and_usernames("asdasd")
      expect(results).not_to include(user)
    end
  end
end
