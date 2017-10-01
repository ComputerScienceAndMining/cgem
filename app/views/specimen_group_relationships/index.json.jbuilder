json.array!(@specimen_group_relationships) do |specimen_group_relationship|
  json.extract! specimen_group_relationship, :id, :specimen_id, :specimen_group_id
  json.url specimen_group_relationship_url(specimen_group_relationship, format: :json)
end
