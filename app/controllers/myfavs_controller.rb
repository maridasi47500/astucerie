class MyfavsController < ApplicationController
  before_action :set_myfav, only: %i[ show edit update destroy ]

  # GET /myfavs or /myfavs.json
  def index
    @myfavs = Myfav.all
  end

  # GET /myfavs/1 or /myfavs/1.json
  def show
  end

  # GET /myfavs/new
  def new
    @myfav = Myfav.new
  end

  # GET /myfavs/1/edit
  def edit
  end

  # POST /myfavs or /myfavs.json
  def create
    @myfav = Myfav.new(myfav_params)

    respond_to do |format|
      if @myfav.save
        format.html { redirect_to myfav_url(@myfav), notice: "Myfav was successfully created." }
        format.json { render :show, status: :created, location: @myfav }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @myfav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myfavs/1 or /myfavs/1.json
  def update
    respond_to do |format|
      if @myfav.update(myfav_params)
        format.html { redirect_to myfav_url(@myfav), notice: "Myfav was successfully updated." }
        format.json { render :show, status: :ok, location: @myfav }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @myfav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myfavs/1 or /myfavs/1.json
  def destroy
    @myfav.destroy

    respond_to do |format|
      format.html { redirect_to myfavs_url, notice: "Myfav was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myfav
      @myfav = Myfav.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def myfav_params
      params.require(:myfav).permit(:user_id, :tip_id)
    end
end
