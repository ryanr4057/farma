class Cliente < ApplicationRecord
  validates :nome, length: { minimum: 4, message: ":insira pelo menos 2 nomes" }
  validates :cpf, length: { minimum: 14, message: "inválido" }
  validates :idade, numericality: { greater_than_or_equal_to: 18, message: ":somente maiores de 18 anos",  only_integer: true }
end
