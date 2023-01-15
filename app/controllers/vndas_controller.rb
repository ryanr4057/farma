class VndasController < ApplicationController
  before_action :set_vnda, only: %i[ show edit update destroy ]

  # GET /vndas or /vndas.json
  def index
    @vndas = Vnda.all
  end

  # GET /vndas/1 or /vndas/1.json
  def show
  end

  # GET /vndas/new
  def new
    @vnda = Vnda.new
  end

  # GET /vndas/1/edit
  def edit
  end

  # POST /vndas or /vndas.json
  def create
    @vnda = Vnda.new(vnda_params)

    respond_to do |format|
      if @vnda.save
        format.html { redirect_to vnda_url(@vnda), notice: "Vnda was successfully created." }
        format.json { render :show, status: :created, location: @vnda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vnda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vndas/1 or /vndas/1.json
  def update
    respond_to do |format|
      if @vnda.update(vnda_params)
        format.html { redirect_to vnda_url(@vnda), notice: "Vnda was successfully updated." }
        format.json { render :show, status: :ok, location: @vnda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vnda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vndas/1 or /vndas/1.json
  def destroy
    @vnda.destroy

    respond_to do |format|
      format.html { redirect_to vndas_url, notice: "Vnda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vnda
      @vnda = Vnda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vnda_params
      params.fetch(:vnda, {})
    end
end
