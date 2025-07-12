class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.string :nama
      t.string :kategori
      t.integer :harga
      t.text :deskripsi

      t.timestamps
    end
  end
end
