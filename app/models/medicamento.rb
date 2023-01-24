class Medicamento < ApplicationRecord
  has_many :items

  validates :nome, length: { minimum: 1, message: ":inválido" }
  validates :descricao, length: { minimum: 5, message: ":inválido" }
  validates :preco, numericality: { greater_than: 0, message: ":inválido",  only_float: true }
end
