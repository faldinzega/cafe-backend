class MenusController < ApplicationController
  before_action :set_menu, only: %i[show update destroy]

  # GET /menus
  def index
    @menus = Menu.all
    render json: @menus
  end

  # GET /menus/:id
  def show
    render json: @menu
  end

  # POST /menus
  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      render json: @menu, status: :created
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menus/:id
  def update
    if @menu.update(menu_params)
      render json: @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menus/:id
  def destroy
    @menu.destroy!
    head :no_content
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:nama, :kategori, :harga, :deskripsi)
  end
end
