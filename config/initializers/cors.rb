Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*/*"
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      # expose: ['access-token', 'expiry', 'token-type', 'Authorization' ]
      expose: ['access-token', 'expiry', 'token-type', 'Authorization' ]
      # expose: ['Authorization']
  end
end
