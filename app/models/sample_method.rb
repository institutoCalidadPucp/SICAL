class SampleMethod < ApplicationRecord
  include ApplicationHelper

  validates :description, presence: true
  validates :unit_cost, numericality: { :greater_than_or_equal_to => 0 }

  has_many :sample_processeds
  belongs_to :laboratory  

  has_many :sample_categoryx_sample_methods
  has_many :sample_categories, through: :sample_categoryx_sample_methods
  accepts_nested_attributes_for :sample_categoryx_sample_methods, :allow_destroy => true, :reject_if => :all_blank


  enum status: [:active, :inactive]
  enum accreditation: [:accredited, :non_accredited]  

  def self.own_per_user current_user
    if current_user.admin?
      all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end
  def self.names
    SampleMethod.pluck(:name) 
  end
end
