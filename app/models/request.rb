class Request < ApplicationRecord
  validates :laboratory, presence: true
  validates :topic, presence: true

  has_many  :request_service_descriptions, dependent: :destroy
  belongs_to :laboratory

  accepts_nested_attributes_for :request_service_descriptions, allow_destroy: true

  enum status: [:active, :inactive]
  enum stage: [:beginning, :process, :finished]
end
