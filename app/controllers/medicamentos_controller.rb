class MedicamentosController < ApplicationController
  before_action :set_medicamento, only: %i[ show edit update destroy ]

  # GET /medicamentos or /medicamentos.json
  def index
    @medicamentos = Medicamento.all
    .order(preco: :asc)
    .page(params[:page])
  end

  # GET /medicamentos/1 or /medicamentos/1.json
  def show
  end

  # GET /medicamentos/new
  def new
    @medicamento = Medicamento.new
  end

  # GET /medicamentos/1/edit
  def edit
  end

  # POST /medicamentos or /medicamentos.json
  def create
    @medicamento = Medicamento.new(medicamento_params)

    respond_to do |format|
      if @medicamento.save
        format.html { redirect_to medicamento_url(@medicamento), notice: "Medicamento was successfully created." }
        format.json { render :show, status: :created, location: @medicamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicamentos/1 or /medicamentos/1.json
  def update
    respond_to do |format|
      if @medicamento.update(medicamento_params)
        format.html { redirect_to medicamento_url(@medicamento), notice: "Medicamento was successfully updated." }
        format.json { render :show, status: :ok, location: @medicamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicamentos/1 or /medicamentos/1.json
  def destroy
    @medicamento.destroy

    respond_to do |format|
      format.html { redirect_to medicamentos_url, notice: "Medicamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicamento
      @medicamento = Medicamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medicamento_params
      params.require(:medicamento).permit(:nome, :preco, :descricao)
    end
end
