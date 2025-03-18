class DogFact < ApplicationRecord
  belongs_to :author
  # validates that the name,date, and fact are not empty
  validates :dog_fact, :date_published, presence: true
  # validates that the name and fact are unique
  validates :dog_fact, uniqueness: true
end
