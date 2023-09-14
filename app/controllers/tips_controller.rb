class TipsController < ApplicationController
  before_action :set_tip, only: %i[ edit update destroy ]
  before_action :set_my_tip, only: %i[ show  ]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :store_location


  # GET /tips or /tips.json
  def index
    @tips = Tip.all
  end

  # GET /tips/1 or /tips/1.json
  def show
    @comment=Comment.new(user_id:current_user.try(:id),tip_id:@tip.id)
    @nb_notes=@tip.notes.length
  end

  # GET /tips/new
  def new
    @tip = Tip.new(user_id: current_user.id)
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips or /tips.json
  def create
    @tip = Tip.new(tip_params)

    respond_to do |format|
      if @tip.save
        format.html { redirect_to mytip_url(title:@tip.title.parameterize), notice: "Tip was successfully created." }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1 or /tips/1.json
  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to mytip_url(title:@tip.title.parameterize), notice: "Tip was successfully updated." }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1 or /tips/1.json
  def destroy
    @tip.destroy

    respond_to do |format|
      format.html { redirect_to tips_url, notice: "Tip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id])
    end
    def set_my_tip
      @tip = Tip.findtip(params[:title])
    end

    # Only allow a list of trusted parameters through.
    def tip_params
      params.require(:tip).permit(:user_id, :title, :image, :content,:cat_ids=>[])
    end
    private

      def store_location
        session[:user_return_to] = request.path
              end

end
