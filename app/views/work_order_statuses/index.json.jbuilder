json.array!(@work_order_statuses) do |work_order_status|
  json.extract! work_order_status, :id, :name
  json.url work_order_status_url(work_order_status, format: :json)
end
