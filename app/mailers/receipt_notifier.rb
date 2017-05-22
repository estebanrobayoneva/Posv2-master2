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
