class PurchaseReceipt < ActiveRecord::Base
  belongs_to :provider
  has_many :detail_purchase_receipts
  has_many :products, through: :detail_purchase_receipts
  accepts_nested_attributes_for :detail_purchase_receipts,reject_if: :all_blank,allow_destroy: true

end
