class Airport < ApplicationRecord
  validates :code, :terminals, :name, presence: true
end
