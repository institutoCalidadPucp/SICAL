class User < ApplicationRecord


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :users_sample
  has_many :samples, through: :users_sample
  
  belongs_to :role, required: false

  enum category: [:employee, :client]
  enum gender: [:male, :female]

  def set_password
    self.password = "pucppass2017"
    self
  end

  def self.clients_name
    User.client.pluck(:name)
  end
end
