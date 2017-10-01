json.array!(@samples) do |sample|
  json.extract! sample, :id, :code, :remarks, :sample_type_id, :sample_type_version_id, :work_order_id, :data
  json.url sample_url(sample, format: :json)
end
