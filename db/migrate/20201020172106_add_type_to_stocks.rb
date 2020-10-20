class AddTypeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :kind, :integer
  end
end
