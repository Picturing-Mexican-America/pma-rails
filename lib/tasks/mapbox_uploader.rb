# frozen_string_literal: true

# Upload our dataset to mapbox
class MapboxUploader
  include HTTParty
  base_uri 'https://api.mapbox.com'

  def initialize
    @options = { query: { access_token: ENV['MAPBOX_UPLOAD_TOKEN'] } }
  end

  def run; end

  def s3_credentials
    # endpoint at https://api.mapbox.com/uploads/v1/timurian/credentials?access_token=TOKEN
    response = self.class.post('/uploads/v1/picturing-mexican-america/credentials', @options)
    JSON.parse(response) # keys are ["bucket", "key", "accessKeyId", "secretAccessKey", "sessionToken", "url"]
  end
end
