class SampleMethod < ApplicationRecord
  include ApplicationHelper

  validates :description, presence: true
  validates :unit_cost, numericality: { :greater_than_or_equal_to => 0 }

  has_many :sample_processeds
  belongs_to :laboratory  

  enum status: [:active, :inactive]
  enum accreditation: [:accredited, :non_accredited]  

  def self.own_per_user current_user
    if current_user.admin?
      all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end
end
