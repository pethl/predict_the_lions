class UsergamesController < ApplicationController
  before_action :set_usergame, only: [:show, :edit, :update, :destroy]

  # GET /usergames
  # GET /usergames.json
  def index
    @usergames = Usergame.all
  end

  # GET /usergames/1
  # GET /usergames/1.json
  def show
  end

  # GET /usergames/new
  def new
    @usergame = Usergame.new
  end

  # GET /usergames/1/edit
  def edit
  end

  # POST /usergames
  # POST /usergames.json
  def create
    @usergame = Usergame.new(usergame_params)

    respond_to do |format|
      if @usergame.save
        format.html { redirect_to @usergame, notice: 'Usergame was successfully created.' }
        format.json { render :show, status: :created, location: @usergame }
      else
        format.html { render :new }
        format.json { render json: @usergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usergames/1
  # PATCH/PUT /usergames/1.json
  def update
    respond_to do |format|
      if @usergame.update(usergame_params)
        format.html { redirect_to @usergame, notice: 'Usergame was successfully updated.' }
        format.json { render :show, status: :ok, location: @usergame }
      else
        format.html { render :edit }
        format.json { render json: @usergame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usergames/1
  # DELETE /usergames/1.json
  def destroy
    @usergame.destroy
    respond_to do |format|
      format.html { redirect_to usergames_url, notice: 'Usergame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usergame
      @usergame = Usergame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usergame_params
      params.require(:usergame).permit(:user_id, :game_id, :home_win, :away_win, :margin_a, :margin_b, :margin_c, :winning_margin, :points_for_game)
    end
end
