class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
    .page(params[:page])
    @atendentes = Atendente.all
    @clientes = Cliente.all
    @items = Item.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "vendas", template: "vendas/show.html.erb"   # Excluding ".pdf" extension.
      end
    end

  end



  # GET /vendas/1 or /vendas/1.json
  def show
    @atendentes = Atendente.all
    @clientes = Cliente.all
    @items = Item.all
    @medicamentos = Medicamento.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "vendas", template: "vendas/show.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    @atendentes = Atendente.all
    @clientes = Cliente.all
  end

  # GET /vendas/1/edit
  def edit
    @medicamentos = Medicamento.all
    @atendentes = Atendente.all
    @clientes = Cliente.all
    @items = Item.all
    @item = Item.new
    @vendas = Venda.all
  end

  # POST /vendas or /vendas.json
  def create
    @venda = Venda.new(venda_params)
    @atendentes = Atendente.all
    @clientes = Cliente.all


    respond_to do |format|
      if @venda.save
        format.html { redirect_to edit_venda_path(@venda), notice: "Venda was successfully created." }
        format.json { render :edit, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to venda_url(@venda), notice: "Venda was successfully updated." }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    @venda.destroy

    respond_to do |format|
      format.html { redirect_to vendas_url, notice: "Venda Apagada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.require(:venda).permit(:atendente_id, :cliente_id, :total)
    end
end
