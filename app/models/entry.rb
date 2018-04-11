class Entry < ApplicationRecord
  scope :five_latest, -> { order(created_at: :desc).limit(5) }
  validates_length_of :zip, :is => 5
  validates_format_of :zip, :with => /\d{5}/
  scope :has_city, -> {where.not(city: nil)}

  def wind_direction_in_words
    # based on
    # http://snowfence.umn.edu/Components/winddirectionanddegreeswithouttable3.htm
    degrees = (wind_direction.to_i.to_f)

    if (0.00..11.25).include?(degrees)
      return "N"
    elsif (11.25..33.75).include?(degrees)
      return "NNE"
    elsif (33.75..56.25).include?(degrees)
      return "NE"
    elsif (56.25..78.75).include?(degrees)
      return "ENE"
    elsif (78.75..101.25).include?(degrees)
      return "E"
    elsif (101.25..123.75).include?(degrees)
      return "ESE"
    elsif (123.75..146.25).include?(degrees)
      return "SE"
    elsif (146.25..168.75).include?(degrees)
      return "SSE"
    elsif (168.75..191.25).include?(degrees)
      return "S"
    elsif (191.25..213.75).include?(degrees)
      return "SSW"
    elsif (213.75..236.25).include?(degrees)
      return "SW"
    elsif (236.25..258.75).include?(degrees)
      return "WSW"
    elsif (258.75..281.25).include?(degrees)
      return "W"
    elsif (281.25..303.75).include?(degrees)
      return "WNW"
    elsif (303.75..326.25).include?(degrees)
      return "NW"
    elsif (326.25..348.75).include?(degrees)
      return "NNW"
    elsif (348.75..360).include?(degrees)
      return "N"
    else
      return degrees.to_s
    end
  end
end
