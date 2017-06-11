class Service < ApplicationRecord

  belongs_to :user, required: false
  belongs_to :laboratory, required: false

  has_many :sample_preliminaries

  accepts_nested_attributes_for :sample_preliminaries, allow_destroy: true

end

