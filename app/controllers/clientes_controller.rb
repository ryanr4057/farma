class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
    .page(params[:page])
  end

  # GET /clientes/1 or /clientes/1.json
  def show

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente Cadastrado." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente Editado." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @vendas = Venda.all
    condicao = 0

    @vendas.each do |venda|
      if (venda.cliente_id == @cliente.id)
        condicao = 1
      end
    end

    if (condicao == 0)
      @cliente.destroy

      respond_to do |format|
        format.html { redirect_to clientes_url, notice: "Cliente Apagado." }
        format.json { head :no_content }
      end

      else
        respond_to do |format|
          format.html { redirect_to cliente_url(@cliente), notice: "Cliente não pode ser Apagado." }
          format.json { head :no_content }
      end

    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :idade)
    end
end
