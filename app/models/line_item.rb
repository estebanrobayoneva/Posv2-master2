class LineItem < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :product
  belongs_to :cart

  def total_price
    product.valor_unitario * quantity
  end

end