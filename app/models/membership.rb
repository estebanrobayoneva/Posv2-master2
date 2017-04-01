class Membership < ActiveRecord::Base
  belongs_to :society
  has_many :clients

  after_create :afiliarCliente


  def afiliarCliente
    Client.find(1).update(membership_id: self.id)
  end
end
