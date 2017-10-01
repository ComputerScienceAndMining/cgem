json.array!(@work_orders) do |work_order|
  json.extract! work_order, :id, :name, :description, :due_date, :responsible_id, :work_order_status_id, :organisation_id
  json.url work_order_url(work_order, format: :json)
end
