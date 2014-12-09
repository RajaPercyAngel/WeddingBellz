json.array!(@wedding_requests) do |wedding_request|
  json.extract! wedding_request, :id, :sender_id, :reciever_id, :is_accepted, :is_cancel
  json.url wedding_request_url(wedding_request, format: :json)
end
