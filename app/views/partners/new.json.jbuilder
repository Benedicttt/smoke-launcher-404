json.array!(@stat_part) do |stat|
  json.extract! set_post
end
json.url launcher_stats_path(stat, format: :json)
