require_relative '../model/arma'
require_relative '../conexions/connection'

class Controller_arma
  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  def inserir_arma
    database = @connection.connect
    collection = database.database[:arma]

    puts "Digite o ID da arma:"
    STDOUT.flush
    id_arma = gets.chomp
    if !verifica_existencia_arma(id_arma)
      puts "Digite o tipo da arma:"
      STDOUT.flush
      tipo_arma = gets.chomp
      puts "Digite a Descrição da arma:"
      STDOUT.flush
      descricao_arma = gets.chomp

      collection.insert_one({
                              "_id" => id_arma,
                              "tipo" => tipo_arma,
                              "descricao" => descricao_arma
                            })

      data = recupera_arma(id_arma)
      nova_arma = Arma.new(data[0]['_id'], data[0]['tipo'], data[0]['descricao'])
      puts nova_arma.to_s
      nova_arma
    else
      puts "O ID #{id_arma} já está cadastrado"
      nil
    end
  end

  def atualizar_arma
    database = @connection.connect
    collection = database.database[:arma]

    puts "Digite ID da Arma que deseja atualizar:"
    STDOUT.flush
    id_arma = gets.chomp

    if verifica_existencia_arma(id_arma)
      puts "Digite o novo tipo da arma:"
      STDOUT.flush
      novo_tipo = gets.chomp
      puts "Digite a nova Descrição da arma:"
      STDOUT.flush
      nova_descricao = gets.chomp

      collection.update_one({"_id" => id_arma}, {
        "$set" => {
          "tipo" => novo_tipo,
          "descricao" => nova_descricao
        }
      })

      data = recupera_arma(id_arma)
      nova_arma = Arma.new(data[0]['_id'], data[0]['tipo'], data[0]['descricao'])
      puts nova_arma.to_s
      nova_arma
    else
      puts "O ID #{id_arma} não existe"
      nil
    end
  end

  def excluir_arma
    database = @connection.connect
    collection = database.database[:arma]

    puts "Digite o ID da Arma que deseja excluir:"
    STDOUT.flush
    id_arma = gets.chomp

    if verifica_existencia_arma(id_arma)
      data = recupera_arma(id_arma)
      arma = Arma.new(data[0]['_id'], data[0]['tipo'], data[0]['descricao'])
      collection.delete_one({"_id" => id_arma})

      puts "Arma excluída com sucesso"
      puts arma.to_s
    else
      puts "Arma não existe, nenhuma alteração feita"
    end
  end

  def recupera_arma(id_arma)
    database = @connection.connect
    collection = database.database[:armas]
    collection.find({ "_id" => id_arma }).to_a
  end

  def verifica_existencia_arma(id_arma)
    result = recupera_arma(id_arma)
    !result.empty?
  end
end