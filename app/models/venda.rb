class Venda < ApplicationRecord
  has_and_belongs_to_many :items
  belongs_to :atendente
  belongs_to :cliente
end
