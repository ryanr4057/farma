class CreateMedicamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicamentos do |t|

      t.timestamps
    end
  end
end
