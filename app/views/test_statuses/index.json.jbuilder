json.array!(@test_statuses) do |test_status|
  json.extract! test_status, :id, :name
  json.url test_status_url(test_status, format: :json)
end
