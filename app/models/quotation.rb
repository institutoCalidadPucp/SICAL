class Quotation < ApplicationRecord
  validates :total, numericality: { :greater_than_or_equal_to => 0 }
  enum status: [:pending, :revised]        
end
