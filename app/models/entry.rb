class Entry < ApplicationRecord
  scope :five_latest, -> { order(created_at: :desc).limit(5) }
  validates_length_of :zip, :is => 5
  validates_format_of :zip, :with => /\d{5}/
end
