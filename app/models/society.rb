class Society < ActiveRecord::Base
  has_many :discounts
  has_many :categories, through: :discounts
  has_many :memberships

  accepts_nested_attributes_for :discounts,reject_if: :all_blank,allow_destroy: true
  
  def self.search(param)
    return Society.none if param.blank?
    param.strip!
    param.downcase!
    (nombre_matches(param)).uniq
  end
    
  
  def self.nombre_matches(param)
    matches('nombre', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end
