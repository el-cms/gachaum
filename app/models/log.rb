# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :card, optional: true
end
