class Client < ActiveRecord::Base
  belongs_to :membership
  has_many :receipts
  accepts_nested_attributes_for :membership,reject_if: :all_blank,allow_destroy: true
end
