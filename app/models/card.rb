# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user, optional: true
  has_many :logs

  scope :unaffected, -> { where(user: nil) }

  # scope :plop, -> { where(x)}

  scope :available_for_user, ->(u) { where(user: [nil, u.id]) }
end
