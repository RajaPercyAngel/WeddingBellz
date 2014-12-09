class SuccessesController < ApplicationController
  
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!

	def new
		@success = Success.new
end
def create
    @success = Success.new(success_params)
    #puts patient_params
    @success.user_id = current_user.id
   if @success.save
      redirect_to success_path(@success.id)
      flash[:notice] = "Thank you for u Interest!"
    else
     
      flash[:error] = "Something went wrong! please try again!"
    redirect_to new_success_path
end
  end
  def edit
    @success=Success.find(params[:id])
  end
  
  def show
  @successes =Success.find(params[:id])
  end


def index
    @successes = Success.all
end

  def destroy
    @success = Success.find(params[:id])
    @success.destroy
    redirect_to successes_path
  end


def update
  @success = Success.find(params[:id])
    respond_to do |format|
      if @success.update(success_params)
        format.html { redirect_to @success, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @success }
      else
        format.html { render :edit }
        format.json { render json: @success.errors, status: :unprocessable_entity }
      end
    end
  end  

  private
   def set_user
      @success = Success.find(params[:id])
    end

  def success_params
    params.require(:success).permit(:user_id, :name, :marriage_date, :story, :image)
  end
end
