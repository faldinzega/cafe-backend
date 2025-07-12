class AddTotalHargaAndCatatanToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :total_harga, :integer
    add_column :orders, :catatan, :text
  end
end
