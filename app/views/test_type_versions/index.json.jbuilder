json.array!(@test_type_versions) do |test_type_version|
  json.extract! test_type_version, :id, :name, :description, :data, :test_type_id
  json.url test_type_version_url(test_type_version, format: :json)
end
