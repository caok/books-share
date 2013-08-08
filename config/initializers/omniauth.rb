Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '5ed56c8303787e568927',
     '00aefa2bf1a0be38528058c6c598870d25fe3d59'
end
