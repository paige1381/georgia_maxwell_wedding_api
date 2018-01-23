class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not a valid email")
    end
  end
end

class Rsvp < ApplicationRecord
  has_many :guests
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false, message: "An RSVP has already been submitted under this email" }
end
