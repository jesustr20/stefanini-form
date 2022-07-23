class CreateLabs < ActiveRecord::Migration[7.0]
  def change
    create_table :labs do |t|
      t.string :labname
      t.string :code
      t.string :productname
      t.integer :amount
      t.decimal :price, precision: 12, scale: 2

      t.timestamps
    end
  end
end
