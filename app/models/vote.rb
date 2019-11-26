class Vote < ApplicationRecord
  belongs_to :place
  belongs_to :trip
  belongs_to :user
end
