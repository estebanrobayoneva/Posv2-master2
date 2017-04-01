class Receipt < ActiveRecord::Base
  belongs_to :client
  belongs_to :payment
end
