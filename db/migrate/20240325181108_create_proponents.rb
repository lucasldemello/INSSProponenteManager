class CreateProponents < ActiveRecord::Migration[7.0]
  def change
    create_table :proponents do |t|
      t.string :name, null: false
      t.string :cpf, null: false
      t.date :birthdate, null: false
      t.decimal :salary, precision: 10, scale: 2, null: false
      t.decimal :inss_discount, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
