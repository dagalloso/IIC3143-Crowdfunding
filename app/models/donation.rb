# frozen_string_literal: true

class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
