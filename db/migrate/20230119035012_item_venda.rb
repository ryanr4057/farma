class ItemVenda < ActiveRecord::Migration[7.0]
  def change
    create_table :items_vendas do |t|
      t.belongs_to :item
      t.belongs_to :venda
    end
  end
end
