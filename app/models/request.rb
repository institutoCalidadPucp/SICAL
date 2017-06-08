class Request < ApplicationRecord
  validates :laboratory, presence: true
  validates :topic, presence: true

  has_many  :request_service_descriptions, dependent: :destroy

  accepts_nested_attributes_for :request_service_descriptions, allow_destroy: true

  enum status: [:unknown,:accepted,:declined]
end
