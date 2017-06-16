class Role < ApplicationRecord
  include ApplicationHelper
  
  validates :name, presence: true

  has_many  :menu_permits, dependent: :destroy
  has_many  :users, dependent: :destroy
  belongs_to :laboratory, required: false

  accepts_nested_attributes_for :menu_permits, reject_if: :all_blank, allow_destroy: true

  enum status: [:active, :inactive]

  
  def self.own_per_user current_user
    if current_user.admin?
      all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end

  def set_tab_reference
    self.menu_permits.each do |menu|
      default_menupermit = MenuPermit.get_default_tab(menu.name)
      menu.tab_reference = default_menupermit.tab_reference
      menu.tab_icon = default_menupermit.tab_icon
    end
    self
  end

  def menus
    begin
      self.menu_permits
    rescue Exception => e
      []      
    end
  end


end