class Venda < ApplicationRecord
  has_many :items, dependent: :delete_all
  belongs_to :atendente
  belongs_to :cliente


end
