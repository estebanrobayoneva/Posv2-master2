json.extract! client, :id, :tipo_documento, :numero_documento, :nombre, :apellido, :correo, :direccion, :telefono, :created_at, :updated_at
json.url client_url(client, format: :json)
