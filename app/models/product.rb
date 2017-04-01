class Product < ActiveRecord::Base
  has_many :detail_purchase_receipts
  has_many :purchase_receipts, through: :detail_purchase_receipts
  belongs_to :category
end
