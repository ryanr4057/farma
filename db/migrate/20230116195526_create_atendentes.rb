class CreateAtendentes < ActiveRecord::Migration[7.0]
  def change
    create_table :atendentes do |t|
      t.string :nome
      t.integer :usuario
      t.string :cpf
      t.integer :idade

      t.timestamps
    end
  end
end
