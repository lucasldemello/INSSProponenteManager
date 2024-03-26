class CreateProponentPhones < ActiveRecord::Migration[7.0]
  def change
    create_table :proponent_phones do |t|
      t.references :proponent, null: false, foreign_key: true
      t.string :phone_type, default: '0'
      t.string :phone_number, null: false
      t.string :info, default: ""

      t.timestamps
    end
  end
end
