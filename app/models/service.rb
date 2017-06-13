class Service < ApplicationRecord

  #validates :subject, presence: true
  #validates :pick_up_date, presence: true

  belongs_to :user, required: false
  belongs_to :laboratory, required: false

  has_many :sample_preliminaries
  has_many :sample_processeds

  accepts_nested_attributes_for :sample_preliminaries, allow_destroy: true
  accepts_nested_attributes_for :sample_processeds, allow_destroy: true
end

