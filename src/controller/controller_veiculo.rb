require_relative '../model/veiculo'
require_relative '../conexions/connection'
class Controller_veiculo

  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  def inserir_veiculo
    database = @connection.connect
    collection = database.database[:veiculos]

    puts "Insira o ID do Veiculo:"
    STDOUT.flush
    id_veiculo = gets.chomp

    if verifica_existencia_veiculo(id_veiculo)
      puts "Insira o tipo de veiculo:"
      STDOUT.flush
      tipo_veiculo = gets.chomp
      puts "Insira a descrição de Veiculo:"
      STDOUT.flush
      descricao_veiculo = gets.chomp

      collection.insert_one({
                              "_id" => id_veiculo,
                              "tipo_veiculo" => tipo_veiculo,
                              "descricao_veiculo" => descricao_veiculo
                            })

      data = recupera_veiculo(id_veiculo)
      novo_veiculo = Veiculo.new(data[0]['_id'], data[0]['tipo_veiculo'], data[0]['descricao_veiculo'])
      puts novo_veiculo.to_s
      novo_veiculo
    else
      puts "O ID #{id_veiculo} já existe"
      nil
    end
  end

  def atualizar_veiculo
    database = @connection.connect
    collection = database.database[:veiculos]

    puts "Insira o ID do Veiculo:"
    STDOUT.flush
    id_veiculo = gets.chomp

    if verifica_existencia_veiculo(id_veiculo)
      puts "Insira o novo tipo do veiculo:"
      STDOUT.flush
      tipo_veiculo = gets.chomp
      puts "Insira a nova descrição do veiculo:"
      STDOUT.flush
      descricao_veiculo = gets.chomp

      collection.update_one({"_id" => id_veiculo}, {
        "$set" => {
          "tipo_veiculo" => tipo_veiculo,
          "descricao_veiculo" => descricao_veiculo
        }
      })

      data = recupera_veiculo(id_veiculo)
      novo_veiculo = Veiculo.new(data[0]['_id'], data[0]['tipo_veiculo'], data[0]['descricao_veiculo'])
      puts novo_veiculo.to_s
      novo_veiculo
    end
  end

  def excluir_veiculo
    database = @connection.connect
    collection = database.database[:veiculos]

    puts "Insira o ID do Veiculo que deseja excluir:"
    STDOUT.flush
    id_veiculo = gets.chomp
    if verifica_existencia_veiculo(id_veiculo)
      data = recupera_veiculo(id_veiculo)
      veiculo = Veiculo.new(data[0]['_id'], data[0]['tipo_veiculo'], data[0]['descricao_veiculo'])
      collection.delete_one({"_id" => id_veiculo})
      puts "Veículo excluído com sucesso"
      puts veiculo.to_s
    else
      puts "Veículo não existe, nenhuma alteração feita"
    end
  end

  def recupera_veiculo(id_veiculo)
    database = @connection.connect
    collection = database.database[:veiculos]
    collection.find({ "_id" => id_veiculo }).to_a
  end

  def verifica_existencia_veiculo(id_veiculo)
    result = recupera_veiculo(id_veiculo)
    !result.empty?
  end

end
