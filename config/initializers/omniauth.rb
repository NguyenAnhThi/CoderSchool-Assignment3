OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1792168454437916', '6ba4013295c4ce6c69052c1eb8df0195'
end