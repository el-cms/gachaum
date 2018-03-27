# frozen_string_literal: true

class User < ApplicationRecord
  has_one :card
  has_many :logs

  # accepts_nested_attributes_for :card, update_only: true

  def card_id=(id)
    self.card = Card.find(id) || nil unless id.nil? || id == ''
  end

  def card_id
    card.try :id
  end
end
