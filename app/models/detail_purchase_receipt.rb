class DetailPurchaseReceipt < ActiveRecord::Base
  belongs_to :purchase_receipt
  belongs_to :product
  accepts_nested_attributes_for :product,reject_if: :all_blank,allow_destroy: true

end
