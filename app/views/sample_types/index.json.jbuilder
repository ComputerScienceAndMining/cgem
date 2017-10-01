json.array!(@sample_types) do |sample_type|
  json.extract! sample_type, :id, :name, :data
  json.url sample_type_url(sample_type, format: :json)
end
