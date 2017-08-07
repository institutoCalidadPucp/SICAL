class Audit < ApplicationRecord
   #validates :event, :activity_type, presence: true
  before_create :set_laboratory

  enum activity_type: [:action, :added, :deleted, :failed, :passed, :submitted, :updated, :view]

  private
    def set_laboratory
      user = User.find self.author_id
      laboratory = user.laboratory
      if laboratory
        self.laboratory_id = laboratory.id
        self.laboratory_name = laboratory.name
      end
    end
end
