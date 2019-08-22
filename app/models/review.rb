class Review < ApplicationRecord
  belongs_to :destination

  validates :name, presence: true
  validates :text_body, presence: true
end
