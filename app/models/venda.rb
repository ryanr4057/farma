class Venda < ApplicationRecord
  has_many :items
  belongs_to :atendente
  belongs_to :cliente
end
