class Destination < ApplicationRecord
  has_many :reviews

  scope :most_reviews, -> {
  destinations = Destination.all
  temp_num = 0
  most_reviewed = nil
  destinations.each do |destination|
    if destination.reviews.length > temp_num
      temp_num = destination.reviews.length
      most_reviewed = destination
    end
  end
  where(id: most_reviewed.id)
}
end
