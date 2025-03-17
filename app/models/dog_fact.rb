class DogFact < ApplicationRecord
  validates :name, :date_published, :dog_fact, presence: true
  validates :name, :dog_fact, uniqueness: true
end
