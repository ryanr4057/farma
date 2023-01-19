class Item < ApplicationRecord
  belongs_to :medicamento, :optional => true
end
