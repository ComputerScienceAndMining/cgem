json.array!(@pictures) do |picture|
  json.extract! picture, :id, :local_id, :sample_id, :specimen_id, :lab_test_id
  json.url picture_url(picture, format: :json)
end
