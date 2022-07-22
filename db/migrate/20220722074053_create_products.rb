class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :productname
      t.integer :amount
      t.decimal :price, precision: 12, scale: 2
      t.references :laboratory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
