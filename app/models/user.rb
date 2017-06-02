class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, required: false

  enum category: [:employee, :client]
  enum gender: [:male, :female]
  enum status: [:active, :inactive]

  def set_password
    self.password = "pucppass2017"
    self
  end
end
