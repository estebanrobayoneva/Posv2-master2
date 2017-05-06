class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :cart

  def total_price
    product.valor_unitario * quantity
  end
  def create_receipt( valor, formaPago)
    Receipt.create(fecha: self.fecha_afiliacion, valor: valor, client_id: @numeroid, payment_id: formaPago)
    @receipt = Receipt.last
  end
end

