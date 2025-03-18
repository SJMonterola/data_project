class DogFact < ApplicationRecord
  belongs_to :author
  # validates that the name,date, and fact are not empty
  validates :name, :date_published, :dog_fact, presence: true
  # validates that the name and fact are unique
  validates :name, :dog_fact, uniqueness: true
end
