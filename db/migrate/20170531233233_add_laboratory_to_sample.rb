class AddLaboratoryToSample < ActiveRecord::Migration[5.1]
  def change
  	add_reference :laboratories, :sample, index: true
  end
end
