class Discount < ActiveRecord::Base
  belongs_to :society
  belongs_to :category
  accepts_nested_attributes_for :category, reject_if: :all_blank,allow_destroy: true
end
