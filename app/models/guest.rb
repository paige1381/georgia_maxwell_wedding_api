class Guest < ApplicationRecord
  belongs_to :rsvp
  validates :name, :rsvp, presence: true
  validates :name, length: { minimum: 2, too_short: "Please enter a valid name" }, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
end
