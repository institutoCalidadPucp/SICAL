class RequestServiceDescription < ApplicationRecord
  belongs_to :request, required: false

  validates_associated :request

  validates :sample_name, presence: true
  validates :amount, presence: true
end
