class AddCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :model, foreign_key: true
      t.references :stock, foreign_key: true
      t.integer :year
      t.boolean :wheels
      t.boolean :chassis
      t.boolean :lasser
      t.boolean :computer
      t.boolean :engine
      t.boolean :seat
      t.integer :status

      t.timestamps
    end
  end
end
