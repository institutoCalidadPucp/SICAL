class Quotation < ApplicationRecord 
    validates :status, presence: true
    validates :total, numeralicaty: { greater_than_or_equal_to => 0}
    enum status: [:pending, :revised]
end 
