class Role < ApplicationRecord

  validates :name, presence: true

  has_many  :menu_permits, dependent: :destroy
  has_many  :users, dependent: :destroy
  
  accepts_nested_attributes_for :menu_permits, allow_destroy: true

  enum status: [:active, :inactive]

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
