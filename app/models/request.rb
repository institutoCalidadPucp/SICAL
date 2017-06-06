class Request < ApplicationRecord
  validates :laboratory, topic: true
end
