class Airport < ApplicationRecord
  validates :terminals, :name, presence: true
  validates :code, presence: true, uniqueness: true
end
