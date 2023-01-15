class CreateVndas < ActiveRecord::Migration[7.0]
  def change
    create_table :vndas do |t|

      t.timestamps
    end
  end
end
