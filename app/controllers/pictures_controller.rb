class PicturesController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!

	def new
		@picture = Picture.new
end
 
 def create
    
    @picture = Picture.new(picture_params)
    @picture.user_id  = current_user.id
    respond_to do |format|
      if @picture.save        
        format.html { redirect_to pictures_path, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def show
  end


def index
    @pictures = current_user.pictures
end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end

  private
   def set_user
      @picture = Picture.find(params[:id])
    end

  def picture_params
    params.require(:picture).permit(:user_id, :title, :image)
  end
end
