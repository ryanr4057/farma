class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
    .page(params[:page])
    @atendentes = Atendente.all
    @clientes = Cliente.all
    @items = Item.all

  end

  def generate
    @vendas = Venda.all
    pdf = Prawn::Document.new

    pdf.text "BodyFarma - Relatório de vendas"
    pdf.move_down 25

    @vendas.each do |venda|
      pdf.text "-----------Venda #{venda.id.to_s}----------------"
      pdf.move_down 5
      pdf.text "Atendente: #{venda.cliente.nome}"
      pdf.text "Cliente: #{venda.cliente.nome}"
      pdf.text "Total R$: #{venda.total.to_s}"
      pdf.move_down 5
    end

    send_data pdf.render, filename: "relatorio-vendas#{Date.today}.pdf", type: "application/pdf"
  end


  # GET /vendas/1 or /vendas/1.json
  def show
    @atendentes = Atendente.all
    @clientes = Cliente.all
    @items = Item.all
    @medicamentos = Medicamento.all


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
