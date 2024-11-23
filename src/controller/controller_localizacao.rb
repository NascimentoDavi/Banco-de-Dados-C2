require_relative '../model/localizacao'
require_relative '../conexions/connection'

class Controller_localizacao
  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  def listar_localizacoes
    database = @connection.connect
    collection = database.database[:localizacoes]

    puts "Localizações disponíveis:"
    collection.find.each do |doc|
      puts "ID: #{doc['_id']} | Nome: #{doc['nome_localizacao']} | Tipo: #{doc['tipo_localizacao']}"
    end
  end

  def inserir_localizacao
    database = @connection.connect
    collection = database.database[:localizacoes]

    puts "Insira o ID da localização:"
    STDOUT.flush
    id_localizacao = gets.chomp

    if !verifica_existencia_localizacao(id_localizacao)
      puts "Insira o nome da localização:"
      STDOUT.flush
      nome_localizacao = gets.chomp
      puts "Insira o tipo da localização:"
      STDOUT.flush
      tipo_localizacao = gets.chomp

      collection.insert_one({
                              "_id" => id_localizacao,
                              "nome_localizacao" => nome_localizacao,
                              "tipo_localizacao" => tipo_localizacao
                            })

      data = recupera_localizacao(id_localizacao)
      nova_localizacao = Localizacao.new(data[0]['_id'], data[0]['nome_localizacao'], data[0]['tipo_localizacao'])
      puts nova_localizacao.to_s
      nova_localizacao
    else
      puts "O ID #{id_localizacao} já existe"
      nil
    end
  end

  def atualizar_localizacao
    database = @connection.connect
    collection = database.database[:localizacoes]

    puts "Digite o ID da localização que deseja atualizar:"
    STDOUT.flush
    id_localizacao = gets.chomp

    if verifica_existencia_localizacao(id_localizacao)
      puts "Digite o novo nome da localização:"
      STDOUT.flush
      novo_nome_localizacao = gets.chomp
      puts "Digite o novo tipo da localização:"
      STDOUT.flush
      novo_tipo_localizacao = gets.chomp

      collection.update_one({"_id" => id_localizacao}, {
        "$set" => {
          "nome_localizacao" => novo_nome_localizacao,
          "tipo_localizacao" => novo_tipo_localizacao
        }
      })

      data = recupera_localizacao(id_localizacao)
      localizacao_atualizada = Localizacao.new(data[0]['_id'], data[0]['nome_localizacao'], data[0]['tipo_localizacao'])
      puts localizacao_atualizada.to_s
      localizacao_atualizada
    else
      puts "O ID #{id_localizacao} não existe"
      nil
    end
  end

  def excluir_localizacao
    database = @connection.connect
    collection = database.database[:localizacoes]

    puts "Digite o ID da localização que deseja excluir:"
    STDOUT.flush
    id_localizacao = gets.chomp

    if verifica_existencia_localizacao(id_localizacao)
      data = recupera_localizacao(id_localizacao)
      localizacao = Localizacao.new(data[0]['_id'], data[0]['nome_localizacao'], data[0]['tipo_localizacao'])
      collection.delete_one({"_id" => id_localizacao})

      puts "Localização excluída com sucesso"
      puts localizacao.to_s
    else
      puts "Localização não existe, nenhuma alteração feita"
    end
  end

  def recupera_localizacao(id_localizacao)
    database = @connection.connect
    collection = database.database[:localizacoes]
    collection.find({ "_id" => id_localizacao }).to_a
  end

  def verifica_existencia_localizacao(id_localizacao)
    result = recupera_localizacao(id_localizacao)
    !result.empty?
  end
end