class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :nama_pemesan
      t.references :menu, null: false, foreign_key: true
      t.integer :jumlah

      t.timestamps
    end
  end
end
