class Airport < ApplicationRecord
  validates :terminals, :name, :country, :city, presence: true
  validates :code, presence: true, length: { is: 3 }, uniqueness: true
end
