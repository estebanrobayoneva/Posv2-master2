class Detail < ActiveRecord::Base
  belongs_to :product
  belongs_to :receipt
  accepts_nested_attributes_for :product, reject_if: :all_blank,allow_destroy: true
  belongs_to :membership

end
