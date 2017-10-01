json.array!(@specimens) do |specimen|
  json.extract! specimen, :id, :code, :remarks, :sample_id, :specimen_type_id, :specimen_type_version_id, :prepared_by_id, :data
  json.url specimen_url(specimen, format: :json)
end
