class CreateMedicamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicamentos do |t|
      t.string :nome
      t.string :bula
      t.float :preco

      t.timestamps
    end
  end
end
