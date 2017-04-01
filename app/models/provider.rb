class Provider < ActiveRecord::Base
  has_many :purchase_receipts
end
