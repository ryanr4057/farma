class Item < ApplicationRecord
  has_and_belongs_to_many :vendas
  belongs_to :medicamento

  before_save :set_unit
  before_save :set_s_total



  def unit
    @medicamentos = Medicamento.all
    if persisted?
      self[:unit]
    else
      medicamento.preco
    end
  end

  def s_total
    unit*qtd
  end


  private

  def set_unit
    self[:unit] = unit
  end

  def set_s_total
    self[:s_total] = s_total * qtd
  end

end
