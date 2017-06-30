class SampleCategoryxSampleMethod < ApplicationRecord
	belongs_to :sample_category
	belongs_to :sample_method
	has_many :chain_features
	accepts_nested_attributes_for :chain_features, :allow_destroy => true, :reject_if => :all_blank
end
