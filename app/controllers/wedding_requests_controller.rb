class WeddingRequestsController < ApplicationController
  before_action :set_wedding_request, only: [:show, :edit, :update, :destroy, :accept, :reject]
  before_filter :authenticate_user!
  # GET /wedding_requests
  # GET /wedding_requests.json
  def index
    if params[:sent] == "true"
    @requests =  current_user.sent_requests
    else
      @requests =  current_user.recieve_requests
    end
  end

  # GET /wedding_requests/1
  # GET /wedding_requests/1.json
  def show
  end

  # GET /wedding_requests/new
  def new
    @wedding_request = WeddingRequest.new
  end

  # GET /wedding_requests/1/edit
  def edit
  end

  # POST /wedding_requests
  # POST /wedding_requests.json
  def create
    @wedding_request = WeddingRequest.new(wedding_request_params)

      already =  WeddingRequest.where(:sender_id=>@wedding_request.sender_id, :reciever_id=>@wedding_request.reciever_id).first
      if !already
        if @wedding_request.save
          WeddingRequest.create(:sender_id=>@wedding_request.reciever_id, :reciever_id=>@wedding_request.sender_id, :is_accepted=>true)
          if params[:profile]== "true"
           redirect_to profile_path(:id=>@wedding_request.reciever_id), notice: 'Wedding request was successfully sent.'
           else
           redirect_to search_profiles_path(params=>params), notice: 'Wedding request was successfully sent.'

           end 
        end
      else
         redirect_to search_profiles_path(:q=>params[:q]), alert: 'Wedding request already sent.' 
      end
         
  end

  # PATCH/PUT /wedding_requests/1
  # PATCH/PUT /wedding_requests/1.json
  def update
    respond_to do |format|
      if @wedding_request.update(wedding_request_params)
        format.html { redirect_to @wedding_request, notice: 'Wedding request was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding_request }
      else
        format.html { render :edit }
        format.json { render json: @wedding_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
     @wedding_request.is_accepted = true
     @wedding_request.save
     redirect_to wedding_requests_path , notice: 'Wedding request accepted successfully.'
  end

  def reject
    @wedding_request.is_cancel = true
    @wedding_request.save
    redirect_to wedding_requests_path , notice: 'Wedding request rejected successfully.' 
  end
  # DELETE /wedding_requests/1
  # DELETE /wedding_requests/1.json
  def destroy
    @wedding_request.destroy
    respond_to do |format|
      format.html { redirect_to wedding_requests_url, notice: 'Wedding request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding_request
      @wedding_request = WeddingRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_request_params
      params.require(:wedding_request).permit(:sender_id, :reciever_id, :is_accepted, :is_cancel)
    end
end
