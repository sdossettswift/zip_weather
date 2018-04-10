class Entry < ApplicationRecord
  scope :five_latest, -> { order(created_at: :desc).limit(5) }
  validates_length_of :zip, :is => 5
  #TODO: add validation -> zip code length(5); regex(5digits) (per specs )
end
