class Author < ApplicationRecord
  # validates that the name and biography are not empty
  validates :name, :biography, presence:  true
  # validates that the name is unique
  validates :name, uniqueness: true
  # Association to the facts tables
  has_many :cat_facts
  has_many :dog_facts
end
