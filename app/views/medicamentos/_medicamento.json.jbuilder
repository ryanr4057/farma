json.extract! medicamento, :id, :nome, :preco, :descricao, :created_at, :updated_at
json.url medicamento_url(medicamento, format: :json)
