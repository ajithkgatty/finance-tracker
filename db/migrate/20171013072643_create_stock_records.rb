class CreateStockRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_records do |t|
      t.string :ticker
      t.string :name
      t.decimal :close
      t.decimal :open

      t.timestamps
    end
  end
end
