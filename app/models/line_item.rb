class LineItem < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :product
  belongs_to :cart

  def total_price
    product.valor_unitario * quantity
  end
  def total_cuenta
    line_items.to_a.sum { |item| item.total_price }
  end

  def create_receipt_cart(precio_total, cedula_client)
    @participanteR = Client.where("numero_documento = ?", cedula_client)
    t = Time.new
    @pago = Payment.where("nombre = Efectivo")
    Receipt.create(fecha: t, valor: precio_total, client_id: @participanteR.first.id, payment_id: @pago.first.id)
  end

end