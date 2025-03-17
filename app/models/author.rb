class Author < ApplicationRecord
  validates :name, :biography, presence:  true
  validates :name, uniqueness: true
end
