class ContactU < ApplicationRecord
  belongs_to :laboratory, required: true
end
