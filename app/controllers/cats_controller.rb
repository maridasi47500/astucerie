class CatsController < ApplicationController
  before_action :set_cat, only: %i[ edit update destroy ]
  before_action :set_my_cat, only: %i[ show ]

  # GET /cats or /cats.json
  def  myfav
    @tips=user_signed_in? ? current_user.myfavs : Tip.where(id: session[:myfav].keys)
  end
  def index
    @cats = Cat.all
  end

  # GET /cats/1 or /cats/1.json
  def show
    @mycats=Cat.counttips
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats or /cats.json
  def create
    @cat = Cat.new(cat_params)

    respond_to do |format|
      if @cat.save
        format.html { redirect_to cat_url(@cat), notice: "Cat was successfully created." }
        format.json { render :show, status: :created, location: @cat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cats/1 or /cats/1.json
  def update
    respond_to do |format|
      if @cat.update(cat_params)
        format.html { redirect_to cat_url(@cat), notice: "Cat was successfully updated." }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cats/1 or /cats/1.json
  def destroy
    @cat.destroy

    respond_to do |format|
      format.html { redirect_to cats_url, notice: "Cat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end
    def set_my_cat
      @cat = Cat.findcat(params[:name])
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:name)
    end
end
