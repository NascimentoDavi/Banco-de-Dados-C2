require_relative '../conexions/connection'
require_relative '../model/vilao_veiculo'

class Controller_vilao_veiculo
  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  def inserir_vilao_veiculo
    database = @connection.connect
    collection = database.database[:vilao_veiculo]

    puts "ID do Vilão:"
    id_vilao = gets.chomp
    puts "ID do Veículo:"
    id_veiculo = gets.chomp

    unless verifica_existencia_vilao_veiculo(id_vilao, id_veiculo)
      collection.insert_one({
                              "vilao_id" => id_vilao,
                              "veiculo_id" => id_veiculo
                            })
      puts "Associação Vilão #{id_vilao} com Veículo #{id_veiculo} inserida com sucesso."
    else
      puts "A associação Vilão #{id_vilao} com Veículo #{id_veiculo} já existe."
    end
  end

  def excluir_vilao_veiculo
    database = @connection.connect
    collection = database.database[:vilao_veiculo]

    puts "ID do Vilão:"
    id_vilao = gets.chomp
    puts "ID do Veículo:"
    id_veiculo = gets.chomp

    if verifica_existencia_vilao_veiculo(id_vilao, id_veiculo)
      collection.delete_one({
                              "vilao_id" => id_vilao,
                              "veiculo_id" => id_veiculo
                            })
      puts "Associação Vilão #{id_vilao} com Veículo #{id_veiculo} removida com sucesso."
    else
      puts "A associação Vilão #{id_vilao} com Veículo #{id_veiculo} não existe."
    end
  end

  def verifica_existencia_vilao_veiculo(id_vilao, id_veiculo)
    database = @connection.connect
    collection = database.database[:vilao_veiculo]
    result = collection.find({ "vilao_id" => id_vilao, "veiculo_id" => id_veiculo }).to_a
    !result.empty?
  end
end