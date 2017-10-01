json.array!(@parameters) do |parameter|
  json.extract! parameter, :id, :key, :value
  json.url parameter_url(parameter, format: :json)
end
