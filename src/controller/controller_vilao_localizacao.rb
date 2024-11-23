require_relative '../conexions/connection'

class Controller_vilao_localizacao
  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  def inserir_vilao_localizacao
    database = @connection.connect
    collection = database.database[:vilao_localizacao]

    puts "ID do Vilão:"
    id_vilao = gets.chomp
    puts "ID da Localização:"
    id_localizacao = gets.chomp

    unless verifica_existencia_vilao_localizacao(id_vilao, id_localizacao)
      collection.insert_one({
                              "vilao_id" => id_vilao,
                              "localizacao_id" => id_localizacao
                            })
      puts "Associação Vilão #{id_vilao} com Localização #{id_localizacao} inserida com sucesso."
    else
      puts "A associação Vilão #{id_vilao} com Localização #{id_localizacao} já existe."
    end
  end

  def excluir_vilao_localizacao
    database = @connection.connect
    collection = database.database[:vilao_localizacao]

    puts "ID do Vilão:"
    id_vilao = gets.chomp
    puts "ID da Localização:"
    id_localizacao = gets.chomp

    if verifica_existencia_vilao_localizacao(id_vilao, id_localizacao)
      collection.delete_one({
                              "vilao_id" => id_vilao,
                              "localizacao_id" => id_localizacao
                            })
      puts "Associação Vilão #{id_vilao} com Localização #{id_localizacao} removida com sucesso."
    else
      puts "A associação Vilão #{id_vilao} com Localização #{id_localizacao} não existe."
    end
  end

  def verifica_existencia_vilao_localizacao(id_vilao, id_localizacao)
    database = @connection.connect
    collection = database.database[:vilao_localizacao]
    result = collection.find({ "vilao_id" => id_vilao, "localizacao_id" => id_localizacao }).to_a
    !result.empty?
  end
end