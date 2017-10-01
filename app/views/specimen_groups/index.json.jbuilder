json.array!(@specimen_groups) do |specimen_group|
  json.extract! specimen_group, :id, :work_order_id, :name, :description
  json.url specimen_group_url(specimen_group, format: :json)
end
