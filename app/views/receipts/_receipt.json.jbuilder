json.extract! receipt, :id, :fecha, :valor, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
