class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)

    # Hitung total harga berdasarkan harga menu x jumlah
    menu = Menu.find_by(id: order.menu_id)
    if menu
      order.total_harga = menu.harga * order.jumlah
    end

    if order.save
      render json: order, status: :created
    else
      render json: { error: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: Order.includes(:menu).map { |order|
      menu = order.menu
      harga = menu&.harga || 0
      jumlah = order.jumlah || 0

      {
        id: order.id,
        nama_pemesan: order.nama_pemesan,
        menu: menu&.nama || "Menu tidak ditemukan",
        jumlah: jumlah,
        total: harga * jumlah,
        catatan: order.catatan,
        status: order.respond_to?(:status) ? order.status : nil
      }
    }
  end

  def destroy
    order = Order.find_by(id: params[:id])

    if order
      order.destroy
      head :no_content
    else
      render json: { error: "Order tidak ditemukan" }, status: :not_found
    end
  end

  private

  def order_params
    params.require(:order).permit(:nama_pemesan, :menu_id, :jumlah, :catatan)
  end
end
