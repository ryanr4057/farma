class CreateVendedors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendedors do |t|

      t.timestamps
    end
  end
end
