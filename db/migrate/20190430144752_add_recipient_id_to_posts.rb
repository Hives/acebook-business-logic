# frozen_string_literal: true

class AddRecipientIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :recipient, foreign_key: { to_table: :users }
  end
end
