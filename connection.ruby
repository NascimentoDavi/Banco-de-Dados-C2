require 'mongo'
require 'json'

# Load configuration from the JSON file
config = JSON.parse(File.read('info.json'))

# Construct the URI from the config data
uri = "mongodb+srv://#{config['username']}:#{config['password']}@#{config['host']}/?retryWrites=#{config['options']['retryWrites']}&w=#{config['options']['w']}&appName=#{config['options']['appName']}"

# Set the server_api field in the options hash
options = { server_api: { version: config['options']['server_api_version'] } }

# Create a new client and connect to the server
client = Mongo::Client.new(uri, options)

# Test the connection
begin
  admin_client = client.use(config['database'])
  result = admin_client.database.command(ping: 1)
  puts "Pinged your deployment. You successfully connected to MongoDB!"
rescue Mongo::Error::OperationFailure => ex
  puts ex
ensure
  client.close
end
