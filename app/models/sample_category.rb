class SampleCategory < ApplicationRecord
  include ApplicationHelper

  validates :name, presence: true
  validates :description, presence: true
  
  belongs_to :laboratory, required: false

  has_many :sample_processeds

  has_many :sample_categoryx_sample_methods
  has_many :sample_methods, through: :sample_categoryx_sample_methods
  accepts_nested_attributes_for :sample_categoryx_sample_methods, :allow_destroy => true, :reject_if => :all_blank
  
  enum status: [:active, :inactive]

  def self.own_per_user current_user
    if current_user.admin?
      all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end
  
end
