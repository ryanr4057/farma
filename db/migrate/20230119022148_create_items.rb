class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :qtd
      t.float :total
      t.references :medicamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
