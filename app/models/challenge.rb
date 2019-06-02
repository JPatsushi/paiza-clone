class Challenge < ApplicationRecord
  has_many :tests
  has_many :confirmations
end
