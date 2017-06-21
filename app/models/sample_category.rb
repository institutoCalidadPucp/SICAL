class SampleCategory < ApplicationRecord
  include ApplicationHelper

  validates :name, presence: true
  validates :description, presence: true
  belongs_to :laboratory, required: false
  #belongs_to :sample_processed
  enum status: [:active, :inactive]

  def self.own_per_user current_user
    if current_user.admin?
      all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end
end
