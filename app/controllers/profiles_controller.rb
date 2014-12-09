class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  before_action :is_admin, :only => :index
  
  # GET /users
  # GET /users.json
  def index
    
    @users = User.all
  
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end
  
  def register
    @user = current_user
    @profileId = ("WB" + rand(36**5).to_s(36)).upcase
  end

  def search
   # @search = User.search(params[:q])
   # @users = @search.result   # load all matching records
 # raise params.inspect 
    data={} 
    data[:dob_gte] = Date.today - params[:age].to_i.years
    data[:marital_status_eq] = params[:marital]
    data[:religion_cont] = params[:religeon]
    data[:community_cont] = params[:community]
    data[:country_eq] = params[:living_in]
    data[:gender_eq] = current_user.gender=="Male" ? "Female" : "Male"
    @a = User.search(data)
    @users = @a.result
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
        format.html { redirect_to @user, notice: 'user was successfully created.' }
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
        @user.is_completed = true
      if @user.update(user_params)
        format.html { redirect_to profile_path(@user), notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to register_profile_path(@user), alert: 'Something is wrong' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if @user = User.find(params[:id])
        flash[:notice] = "User wassuccessfully destroyed"
      else
        flash[:error] = "Sorry Plz try again"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:gender, 
                                    :first_name, 
                                    :last_name,  
                                    :gender,  
                                    :profile_for,
                                    :dob,
                                    :religion,
                                    :mother_tongue,
                                    :living_in,
                                    :state,
                                    :mobile_no,
                                    :i_agree,
                                    :marital_status,
                                    :height,
                                    :skin_tone,
                                    :body_type,
                                    :diet,
                                    :smoke,
                                    :drink,
                                    :education_level,
                                    :occupation,
                                    :annual_income,
                                    :community,
                                    :more_info,
                                    :avatar,
                                    :profile_id,
                                    :age)
    end
end
