json.array!(@specimen_type_versions) do |specimen_type_version|
  json.extract! specimen_type_version, :id, :specimen_type_id, :name, :data
  json.url specimen_type_version_url(specimen_type_version, format: :json)
end
