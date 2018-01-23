class Guest < ApplicationRecord
  belongs_to :rsvp
  validates :name, presence: true
end
