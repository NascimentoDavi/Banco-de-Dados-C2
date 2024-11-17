# main.rb
require_relative 'conexions/connection' # Ajuste o caminho para a pasta "conexions"

def main
  config_file = 'conexions/info/login.json'

  # Crie um objeto de conexão
  connection = Connection.new(config_file)

  # Tente conectar ao banco de dados
  client = connection.connect

  if client
    begin
      # Escolhe um banco de dados e uma coleção
      database = client.use('teste_db')
      collection = database[:test_collection]

      # Limpa a coleção para testes
      collection.delete_many

      # Insere documentos na coleção
      puts "Inserindo documentos..."
      collection.insert_many([
        { name: "Alice", age: 30, city: "New York" },
        { name: "Bob", age: 25, city: "San Francisco" },
        { name: "Charlie", age: 35, city: "Boston" }
      ])

      # Exibe todos os documentos da coleção
      puts "Documentos na coleção:"
      collection.find.each do |doc|
        puts doc
      end

      # Exemplo de consulta filtrada
      puts "Documentos com idade maior que 30:"
      collection.find({ age: { '$gt': 30 } }).each do |doc|
        puts doc
      end

    rescue Mongo::Error => e
      puts "Erro ao realizar operações no MongoDB: #{e.message}"
    ensure
      # Encerra a conexão
      connection.disconnect
    end
  else
    puts "Não foi possível estabelecer conexão com o banco de dados."
  end
end


# Execute o programa
main
