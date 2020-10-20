class CreateReportTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :model, foreign_key: true

      t.timestamps
    end
  end
end
