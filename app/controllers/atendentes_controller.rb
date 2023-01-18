class AtendentesController < ApplicationController
  before_action :set_atendente, only: %i[ show edit update destroy ]

  # GET /atendentes or /atendentes.json
  def index
    @atendentes = Atendente.all
    .order(usuario: :asc)
    .page(params[:page])
  end

  # GET /atendentes/1 or /atendentes/1.json
  def show
  end

  # GET /atendentes/new
  def new
    @atendente = Atendente.new
  end

  # GET /atendentes/1/edit
  def edit
  end

  # POST /atendentes or /atendentes.json
  def create
    @atendente = Atendente.new(atendente_params)

    respond_to do |format|
      if @atendente.save
        format.html { redirect_to atendente_url(@atendente), notice: "Atendente was successfully created." }
        format.json { render :show, status: :created, location: @atendente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atendente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendentes/1 or /atendentes/1.json
  def update
    respond_to do |format|
      if @atendente.update(atendente_params)
        format.html { redirect_to atendente_url(@atendente), notice: "Atendente was successfully updated." }
        format.json { render :show, status: :ok, location: @atendente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atendente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atendentes/1 or /atendentes/1.json
  def destroy
    @atendente.destroy

    respond_to do |format|
      format.html { redirect_to atendentes_url, notice: "Atendente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendente
      @atendente = Atendente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atendente_params
      params.require(:atendente).permit(:nome, :usuario, :cpf, :idade)
    end
end
