# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  delegate :username, to: :author, prefix: :author

  belongs_to :recipient, class_name: "User"
  delegate :username, to: :recipient, prefix: :recipient

  def editable?
    less_than_ten_minutes_old?
  end

  private

  def less_than_ten_minutes_old?
    created_at > 10.minutes.ago
  end
end
