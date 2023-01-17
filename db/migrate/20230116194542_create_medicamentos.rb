class CreateMedicamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicamentos do |t|
      t.string :nome
      t.float :preco
      t.string :descricao

      t.timestamps
    end
  end
end
