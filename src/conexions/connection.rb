require 'mongo'
require 'json'

class Connection


  def initialize(config_file)

    config_file = JSON.parse(File.read(config_file))

    @username = config_file['username']
    @password = config_file['password']
    @host = config_file['host']
    @app_name = config_file['appname']
    @database_name = config_file['databaseName']
    @client = nil

  end

  def connect
    @client = Mongo::Client.new("mongodb+srv://#{@username}:#{@password}@#{@host}/?retryWrites=true&w=majority&appName=#{@app_name}")
    @client.use(@database_name)
  end

  def disconnect
    @client.close
  end


  
end
