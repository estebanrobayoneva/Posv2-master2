class Receipt < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :client
  belongs_to :payment
  has_many :details
  has_many :products, through: :details


  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
    end

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  end

