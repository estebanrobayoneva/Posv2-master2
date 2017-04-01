class Membership < ActiveRecord::Base
  belongs_to :society
  has_many :clients
  after_create :afilia




  def afiliarCliente=(id)

    id2 = id.to_s
    logger.debug "#{id2.is_a?(String)}"
    id3 = id2.tr('({}>="":value\)', '')
    id3[0] = ''
    id3[id3.length-1] = ''
    logger.debug "#{id3}"
    id4 = id3.to_i
    logger.debug "#{id4.is_a?(Integer)}"
    @numeroid= id4

  end
  def afilia
    Client.find(@numeroid).update(membership_id: self.id)
  end
end
