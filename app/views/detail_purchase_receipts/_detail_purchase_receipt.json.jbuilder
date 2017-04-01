json.extract! detail_purchase_receipt, :id, :cantidad, :valor_unitario, :valor_final, :created_at, :updated_at
json.url detail_purchase_receipt_url(detail_purchase_receipt, format: :json)
