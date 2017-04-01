json.extract! payment, :id, :nombre, :created_at, :updated_at
json.url payment_url(payment, format: :json)
