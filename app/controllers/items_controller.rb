class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
    .page(params[:page])
    @medicamentos = Medicamento.all

  end

  def unit
    @medicamentos = Medicamento.all
    if persisted?
      self[:unit]
    else
      medicamento.preco
    end
  end

  def s_total
    unit*qtd
  end



  # GET /items/1 or /items/1.json
  def show
    @medicamentos = Medicamento.all
  end

  # GET /items/new
  def new
    @item = Item.new
    @medicamentos = Medicamento.all
    @vendas = Venda.all
  end

  # GET /items/1/edit
  def edit
    @medicamentos = Medicamento.all
  end



  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @medicamentos = Medicamento.all

    respond_to do |format|
      if @item.save
        format.html { redirect_to edit_venda_path("@venda"), notice: "Medicamento Adicionado." }
        format.json { render :show, status: :created, location: @item }
      else

      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @medicamentos = Medicamento.all
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@venda), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to edit_venda_path("@venda"), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_unit
    self[:unit] = unit
  end



  def set_s_total
    self[:s_total] = s_total * qtd
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:medicamento_id, :venda_id, :qtd)
    end
end
