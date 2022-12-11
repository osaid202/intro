class SpicesController < ApplicationController
  before_action :set_spice, only: %i[ show edit update destroy ]

  # GET /spices or /spices.json
  def index
    @spices = Spice.all
  end

  # GET /spices/1 or /spices/1.json
  def show
  end

  # GET /spices/new
  def new
    @spice = Spice.new
  end

  # GET /spices/1/edit
  def edit
  end

  # POST /spices or /spices.json
  def create
    @spice = Spice.new(spice_params)

    respond_to do |format|
      if @spice.save
        format.html { redirect_to spice_url(@spice), notice: "Spice was successfully created." }
        format.json { render :show, status: :created, location: @spice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spices/1 or /spices/1.json
  def update
    respond_to do |format|
      if @spice.update(spice_params)
        format.html { redirect_to spice_url(@spice), notice: "Spice was successfully updated." }
        format.json { render :show, status: :ok, location: @spice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spices/1 or /spices/1.json
  def destroy
    @spice.destroy

    respond_to do |format|
      format.html { redirect_to spices_url, notice: "Spice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spice
      @spice = Spice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spice_params
      params.require(:spice).permit(:name)
    end
end
