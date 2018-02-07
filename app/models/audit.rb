class Audit < ApplicationRecord

  ACTIVITY_HASH = {"action": "Realizando un","added": "Creando un", "deleted": "Eliminando un", "updated": "Actualizando un", "submitted": "Registrando un" }

  before_create :set_laboratory

  enum activity_type: [:action, :added, :deleted, :submitted, :updated]


  def self.activities
    ACTIVITY_HASH  
  end


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
