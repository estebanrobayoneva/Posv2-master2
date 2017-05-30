class Client < ActiveRecord::Base
  
  belongs_to :membership
  has_many :receipts
  accepts_nested_attributes_for :membership,reject_if: :all_blank,allow_destroy: true
  
  
  
  def self.search(param)
    return Client.none if param.blank?
    param.strip!
    param.downcase!
    (nombre_matches(param)+ apellido_matches(param) + numero_documento_matches(param)).uniq
  end
    
  
  def self.nombre_matches(param)
    matches('nombre', param)
  end
  
  def self.apellido_matches(param)
    matches('apellido', param)
  end
  
  def self.numero_documento_matches(param)
    matches_int('numero_documento', param)
  end
    
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
  
  def self.matches_int(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end
  
  
end
