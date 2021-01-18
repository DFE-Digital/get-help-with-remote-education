# This will affect assets served from /app/assets
Rails.application.config.static_cache_control = 'public, max-age=3600'

# This will affect assets in /public, e.g. webpacker assets.
Rails.application.config.public_file_server.headers = {
  'Cache-Control' => 'public, max-age=3600',
  'Expires' => 1.hour.from_now.to_formatted_s(:rfc822)
}