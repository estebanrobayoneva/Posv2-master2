# Preview all emails at http://localhost:3000/rails/mailers/receipt_notifier
class ReceiptNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_notifier/received
  def received
    ReceiptNotifier.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/receipt_notifier/shipped
  def shipped
    ReceiptNotifier.shipped
  end

end
