class Place < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :votes
end
