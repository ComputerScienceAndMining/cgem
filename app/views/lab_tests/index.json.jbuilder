json.array!(@lab_tests) do |lab_test|
  json.extract! lab_test, :id, :started_at, :ended_at, :work_order_id, :test_status_id, :test_type_id, :test_type_version_id, :specimen_id, :tested_by_id, :data
  json.url lab_test_url(lab_test, format: :json)
end
