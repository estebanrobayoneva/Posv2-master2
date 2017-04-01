json.extract! product, :id, :nombre, :cantidad, :valor_unitario, :valor_total_curso, :created_at, :updated_at
json.url product_url(product, format: :json)
