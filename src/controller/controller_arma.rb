require_relative '../model/arma'
require_relative '../conexions/connection'

class Controller_arma
  def initialize
    config_file = 'conexions/info/login.json'
    @connection = Connection.new(config_file)
  end

  # @return[Arma]
  def inserir_arma

    database = @connection.connect
    collection = database.database[:arma]

    puts "Digite o ID da arma:"
    id_arma = gets.chomp
    if !verifica_existencia_arma(id_arma)
      puts "Digite o tipo da arma:"
      tipo_arma = gets.chomp

      puts "Digite a Descrição da arma:"
      descricao_arma = gets.chomp

      collection.insert_one({"_id" => id_arma,
                           "tipo" => tipo_arma,
                           "descricao" => descricao_arma})

      data = JSON.parse(recupera_arma(id_arma))
      nova_arma = Arma.new(data[0]['_id'], data[0]['tipo'], data[0]['descricao'])
      puts nova_arma.to_s
      nova_arma
    else
      puts "O ID #{id_arma} já está cadastrado"
      nil
    end
  end

  # @return[Arma]
  def atualizar_arma

    database = @connection.connect
    collection = database.database[:arma]

    puts "Digite ID da Arma que deseja atualizar:"
    id_arma = gets.chomp

    if verifica_existencia_arma(id_arma)
      puts "Digite o novo tipo da arma:"
      novo_tipo = gets.chomp

      puts "Digite a nova Descriço da arma:"
      nova_descricao = gets.chomp

      collection.update_one({"_id" => id_arma}, {"tipo" => novo_tipo, "descricao" => nova_descricao})

      data = JSON.parse(recupera_arma(id_arma))
      nova_arma = Arma.new(data['_id'], data['tipo'], data['descricao'])
      puts nova_arma.to_s
      nova_arma
    end
  end

  def excluir_arma
    database = @connection.connect
    collection = database.database[:arma]

    puts "Digite o ID da Arma que deseja excluir:"
    id_arma = gets.chomp

    if verifica_existencia_arma(id_arma)
      data = JSON.parse(recupera_arma(id_arma))
      arma = Arma.new(data['_id'], data['tipo'], data['descricao'])
      collection.delete_one({"_id" => id_arma})

      puts "Arma excluida com sucesso"
      puts arma.to_s
    end
  end

  def recupera_arma(id_arma)
    database = @connection.connect
    collection = database.database[:arma]

    collection.find({ "_id" => id_arma}, { "tipo": 1, "descricao": id_arma, "_id": 1})
  end

  # @return [Boolean]
  def verifica_existencia_arma(id_arma) 
    if JSON.parse(recupera_arma(id_arma)).empty
      false
    else
      true
    end
  end
end