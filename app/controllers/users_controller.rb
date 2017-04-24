class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :pick_team, :predict_games, :lock_players, :lock_games]
  before_filter :authenticate_user!, only: [:pick_team, :pick_team, :show, :edit, :index]
  before_filter :verify_is_admin, only: [:index]
  before_action :check_user, only: [:pick_team, :pick_team, :edit, :show]

 def create_predictions
   user = current_user
   player_ids = Player.all.pluck(:id)
   player_ids.each do |player|
     Userplayer.create(user_id: user.id, player_id: player, selected: false)
   end
   game_ids = Game.all.pluck(:id)
   game_ids.each do |game|
     Usergame.create(user_id: user.id, game_id: game)
   end
  redirect_to(pick_team_user_path(user))
 end
 
 def pick_team
   @selected = @user.userplayers.where(selected: true)
   @unselected = @user.userplayers.where(selected: false)
 end
 
 def predict_games
 end
 
 def lock_players
   @user.update_attribute(:lock_players, TRUE)
    redirect_to pick_team_user_path(@user), notice: 'Squad selection is now locked, please go to Predict Games to continue.'
 end
 
 def lock_games
   @user.update_attribute(:lock_games, TRUE)
   redirect_to predict_games_user_path(@user), notice: 'Game predictions are now locked, follow your progress via the Scoreboard.'
 end
 
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
   @selected = @user.userplayers.where(selected: true)
  #  @unselected = @user.userplayers.where(selected: false)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if user_params[:userplayers_attributes].present?
         format.html { redirect_to pick_team_user_path(@user) }
       elsif user_params[:usergames_attributes].present?
           format.html { redirect_to predict_games_user_path(@user), notice: 'Predictions have been saved.' }
         end
        
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :lock_players, :lock_games, :userplayers_attributes => [:id, :player_id, :user_id, :selected], :usergames_attributes => [:id, :user_id, :game_id, :home_win, :away_win, :margin_a, :margin_b, :margin_c, :winning_margin, :points_for_game])
    end
    
    def check_user
      if current_user != @user
             redirect_to root_url, alert: "Sorry, This Profile belongs to someone else !"
           end
         end
end
