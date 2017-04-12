class Membership < ActiveRecord::Base
  belongs_to :society
  has_many :clients

  after_create :afilia
  after_create :fechas




  def afiliarCliente=(id)

    id2 = id.to_s
    logger.debug "#{id2.is_a?(String)}"
    id3 = id2.tr('({}>="":value\)', '')
    id3[0] = ''
    id3[id3.length-1] = ''
    logger.debug "#{id3}"
    id4 = id3.to_i
    logger.debug "#{id4.is_a?(Integer)}"
    @numeroid= id4

  end
  def afilia
    Client.find(@numeroid).update(membership_id: self.id)
  end
  def create_receipt( valor, formaPago)
    Receipt.create(fecha: self.fecha_afiliacion, valor: valor, client_id: @numeroid, payment_id: formaPago)

  end
  def fechas
    t = Time.new
    self.update(fecha_afiliacion: t)
    if self.periodicidad == 'Anual'
      self.update(fecha_vencimiento: t+(60*60*24*365))
      self.update(fecha_cuota: t+(60*60*24*365))
    elsif self.periodicidad == 'Mensual'
      self.update(fecha_vencimiento: t+2592000)
      self.update(fecha_cuota: t+2592000 )

    end
    self.update(estado: TRUE)
  end
  def s_receipt(fecha, cliente_id, formaPago, membership_id, valor)
    Receipt.create(fecha: fecha, client_id: cliente_id, payment_id: formaPago, valor: valor)
  end

  def updateAcomulado(valor)
    #modificar el volor acomulado por cada cuota

    #valorF = self.pago_acomulado+valor
    #self.update(pago_acomulado: valorF)

    #cambio de fecha poxima cuota
    fecha = self.fecha_cuota
    if self.periodicidad == 'Anual'

      #self.update(fecha_vencimiento: t+(60*60*24*365))
      #self.update(fecha_cuota: t+(60*60*24*365))
    elsif self.periodicidad == 'Mensual'
      puts (self.fecha_cuota + 2592000)
      #self.update(fecha_vencimiento: fecha+2592000)
      #self.update(fecha_cuota: fecha+2592000 )

    end

  end

end
