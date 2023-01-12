json.extract! medicamento, :id, :nome, :bula, :preco, :created_at, :updated_at
json.url medicamento_url(medicamento, format: :json)
