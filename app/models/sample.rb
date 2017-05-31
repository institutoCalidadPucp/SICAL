class Sample < ApplicationRecord
  validates :description, presence: true
  validates :category, presence: true

  has_many :features

  accepts_nested_attributes_for :features, allow_destroy: true
end
