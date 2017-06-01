class Sample < ApplicationRecord
  validates :description, presence: true
  validates :category, presence: true

  #has_many :features
  has_many :users_sample
  has_many :users, through: :users_sample
  has_one :laboratory

  accepts_nested_attributes_for :users_sample, allow_destroy: true
end

