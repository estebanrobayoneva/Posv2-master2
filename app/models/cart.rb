class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id, cantidad)
    current_item = line_items.find_by_product_id(product_id)
    c = cantidad.to_i
    if current_item

      current_item.quantity += c
    else
      current_item = line_items.build(product_id: product_id, quantity: c)
    end
    current_item
  end
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
