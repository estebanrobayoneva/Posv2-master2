class Payment < ActiveRecord::Base
  has_many :receipts
end
