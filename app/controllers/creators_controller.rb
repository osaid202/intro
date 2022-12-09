class CreatorsController < ApplicationController
  before_action :set_creator, only: %i[ show edit update destroy ]

  # GET /creators or /creators.json
  def index
    @creators = Creator.all
  end

  # GET /creators/1 or /creators/1.json
  def show
  end

  # GET /creators/new
  def new
    @creator = Creator.new
  end

  # GET /creators/1/edit
  def edit
  end

  # POST /creators or /creators.json
  def create
    @creator = Creator.new(creator_params)

    respond_to do |format|
      if @creator.save
        format.html { redirect_to creator_url(@creator), notice: "Creator was successfully created." }
        format.json { render :show, status: :created, location: @creator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creators/1 or /creators/1.json
  def update
    respond_to do |format|
      if @creator.update(creator_params)
        format.html { redirect_to creator_url(@creator), notice: "Creator was successfully updated." }
        format.json { render :show, status: :ok, location: @creator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creators/1 or /creators/1.json
  def destroy
    @creator.destroy

    respond_to do |format|
      format.html { redirect_to creators_url, notice: "Creator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creator_params
      params.require(:creator).permit(:name, :nationality)
    end
end
