class MenuPermit < ApplicationRecord

  scope :get_default_tab, -> (tab_name) { where(default: true).find_by_name tab_name }
  scope :client_tabs, -> () {where(available_for_client: true)}

  def self.names
  	MenuPermit.pluck(:name)	
  end

  def self.update_attributes
    self.all.each do |menu|
      default_menupermit = MenuPermit.get_default_tab(menu.name)
      ref = default_menupermit.is_a?(ActiveRecord::Base) ? default_menupermit : default_menupermit.first
      menu.tab_reference, menu.tab_icon = ref.tab_reference, ref.tab_icon
    end
  end

end
