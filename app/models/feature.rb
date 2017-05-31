class Feature < ApplicationRecord
  belongs_to :sample  
  validates :value, numericality: true, presence: true
  validates :name, presence: true
end
