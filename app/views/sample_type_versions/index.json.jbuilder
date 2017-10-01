json.array!(@sample_type_versions) do |sample_type_version|
  json.extract! sample_type_version, :id, :sample_type_id, :name, :data
  json.url sample_type_version_url(sample_type_version, format: :json)
end
