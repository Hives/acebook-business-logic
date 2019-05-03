# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }

  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { in: 6..10 }

  has_secure_password

  def self.search_emails_and_usernames(query)
    self.where("lower(username) LIKE ? ", "%#{query.downcase}%")
  end
end
