class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :phone, length: { in: 7..9}
  validates :phone, numericality: true
  validates :name, presence: true

  enum category: [:employee, :client]
end
