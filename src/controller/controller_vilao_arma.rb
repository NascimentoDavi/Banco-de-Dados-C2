require_relative '../conexions/connection'
require_relative '../model/vilao_arma'

class Controller_vilao_arma
  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  def inserir_vilao_arma
    database = @connection.connect
    collection = database.database[:vilao_arma]

    puts "ID do Vilão:"
    id_vilao = gets.chomp
    puts "ID da Arma:"
    id_arma = gets.chomp

    unless verifica_existencia_vilao_arma(id_vilao, id_arma)
      collection.insert_one({
                              "vilao_id" => id_vilao,
                              "arma_id" => id_arma
                            })
      puts "Associação Vilão #{id_vilao} com Arma #{id_arma} inserida com sucesso."
    else
      puts "A associação Vilão #{id_vilao} com Arma #{id_arma} já existe."
    end
  end

  def excluir_vilao_arma
    database = @connection.connect
    collection = database.database[:vilao_arma]

    puts "ID do Vilão:"
    id_vilao = gets.chomp
    puts "ID da Arma:"
    id_arma = gets.chomp

    if verifica_existencia_vilao_arma(id_vilao, id_arma)
      collection.delete_one({
                              "vilao_id" => id_vilao,
                              "arma_id" => id_arma
                            })
      puts "Associação Vilão #{id_vilao} com Arma #{id_arma} removida com sucesso."
    else
      puts "A associação Vilão #{id_vilao} com Arma #{id_arma} não existe."
    end
  end

  def verifica_existencia_vilao_arma(id_vilao, id_arma)
    database = @connection.connect
    collection = database.database[:vilao_arma]
    result = collection.find({ "vilao_id" => id_vilao, "arma_id" => id_arma }).to_a
    !result.empty?
  end
end