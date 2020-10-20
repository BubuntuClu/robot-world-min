class AddModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.string :name
      t.decimal :cost
      t.decimal :price

      t.timestamps
    end
  end
end
