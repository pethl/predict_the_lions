class UserplayersController < ApplicationController
  before_action :set_userplayer, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin, only: [:show, :edit, :update, :destroy, :index]
  

  # GET /userplayers
  # GET /userplayers.json
  def index
    @userplayers = Userplayer.all
  end

  # GET /userplayers/1
  # GET /userplayers/1.json
  def show
  end

  # GET /userplayers/new
  def new
    @userplayer = Userplayer.new
  end

  # GET /userplayers/1/edit
  def edit
  end

  # POST /userplayers
  # POST /userplayers.json
  def create
    @userplayer = Userplayer.new(userplayer_params)

    respond_to do |format|
      if @userplayer.save
        format.html { redirect_to @userplayer, notice: 'Userplayer was successfully created.' }
        format.json { render :show, status: :created, location: @userplayer }
      else
        format.html { render :new }
        format.json { render json: @userplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userplayers/1
  # PATCH/PUT /userplayers/1.json
  def update
    respond_to do |format|
      if @userplayer.update(userplayer_params)
        format.html { redirect_to @userplayer, notice: 'Userplayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @userplayer }
      else
        format.html { render :edit }
        format.json { render json: @userplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userplayers/1
  # DELETE /userplayers/1.json
  def destroy
    @userplayer.destroy
    respond_to do |format|
      format.html { redirect_to userplayers_url, notice: 'Userplayer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userplayer
      @userplayer = Userplayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userplayer_params
      params.require(:userplayer).permit(:user_id, :player_id, :selected)
    end
end
