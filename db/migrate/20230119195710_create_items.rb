class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :medicamento, null: false, foreign_key: true
      t.references :venda, null: false, foreign_key: true
      t.integer :qtd
      t.float :unit
      t.float :s_total

      t.timestamps
    end
  end
end
