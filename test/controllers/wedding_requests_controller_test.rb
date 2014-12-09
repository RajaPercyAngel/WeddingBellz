require 'test_helper'

class WeddingRequestsControllerTest < ActionController::TestCase
  setup do
    @wedding_request = wedding_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wedding_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wedding_request" do
    assert_difference('WeddingRequest.count') do
      post :create, wedding_request: { is_accepted: @wedding_request.is_accepted, is_cancel: @wedding_request.is_cancel, reciever_id: @wedding_request.reciever_id, sender_id: @wedding_request.sender_id }
    end

    assert_redirected_to wedding_request_path(assigns(:wedding_request))
  end

  test "should show wedding_request" do
    get :show, id: @wedding_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wedding_request
    assert_response :success
  end

  test "should update wedding_request" do
    patch :update, id: @wedding_request, wedding_request: { is_accepted: @wedding_request.is_accepted, is_cancel: @wedding_request.is_cancel, reciever_id: @wedding_request.reciever_id, sender_id: @wedding_request.sender_id }
    assert_redirected_to wedding_request_path(assigns(:wedding_request))
  end

  test "should destroy wedding_request" do
    assert_difference('WeddingRequest.count', -1) do
      delete :destroy, id: @wedding_request
    end

    assert_redirected_to wedding_requests_path
  end
end
