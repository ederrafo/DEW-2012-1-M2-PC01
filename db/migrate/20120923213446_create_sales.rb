class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.decimal :total

      t.timestamps
    end
  end
end
