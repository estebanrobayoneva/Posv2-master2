class ReceiptNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_notifier.received.subject
  #
   
  
  def received(receipt)
    puts(receipt)
    @receipt = receipt
    mail to: receipt.client.correo, subject: 'Compra centro de meditacion yamantaka'
  end
  
  def afiliacion(membership, client)
    puts("esta llegando al correo de afiliacion??")
    @client = client
    @membership = membership
    mail to: client.correo, subject: 'Afiliacion al centro de meditacion yamantaka'
  end
  
  def pago_cuota(membership, client)
    puts("esta llegando al correo de pago_cuota??")
    @client = client
    @membership = membership
    mail to: client.correo, subject: 'Pago de la cuota membresia centro de meditacion Yamantaka'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
