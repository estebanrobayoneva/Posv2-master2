json.extract! purchase_receipt, :id, :fecha, :numero_factura, :valor_total, :created_at, :updated_at
json.url purchase_receipt_url(purchase_receipt, format: :json)
