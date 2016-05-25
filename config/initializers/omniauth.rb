Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], scopes: "email, profile, fitness.activity.read, fitness.body.read, fitness.location.read"
end
