require_relative '../model/vilao'
require_relative '../conexions/connection'

class Controller_vilao
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

  def inserir_vilao
    database = @connection.connect
    collection = database.database[:viloes]

    puts "Insira o ID do vilão:"
    STDOUT.flush
    id_vilao = gets.chomp

    if !verifica_existencia_vilao(id_vilao)
      puts "Insira o nome do vilão:"
      STDOUT.flush
      nome_vilao = gets.chomp
      puts "Insira o nome verdadeiro do vilão:"
      STDOUT.flush
      nome_verdadeiro = gets.chomp
      listar_localizacoes
      puts "Digite o ID da Localização:"
      STDOUT.flush
      id_localizacao = gets.chomp
      puts "Digite o nível de periculosidade:"
      STDOUT.flush
      nivel_periculosidade = gets.chomp

      collection.insert_one({
                              "_id" => id_vilao,
                              "nome_vilao" => nome_vilao,
                              "nome_verdadeiro" => nome_verdadeiro,
                              "localizacao" => id_localizacao,
                              "nivel_periculosidade" => nivel_periculosidade
                            })

      data = recupera_vilao(id_vilao)
      novo_vilao = Vilao.new(data[0]['_id'], data[0]['nome_vilao'], data[0]['nome_verdadeiro'], data[0]['localizacao'], data[0]['nivel_periculosidade'])
      puts novo_vilao.to_s
      novo_vilao
    else
      puts "O ID #{id_vilao} já existe"
      nil
    end
  end

  def atualizar_vilao
    database = @connection.connect
    collection = database.database[:viloes]

    puts "Digite o ID do vilão que deseja atualizar:"
    STDOUT.flush
    id_vilao = gets.chomp

    if verifica_existencia_vilao(id_vilao)
      puts "Digite o novo nome do vilão:"
      STDOUT.flush
      novo_nome_vilao = gets.chomp
      puts "Digite o novo nome verdadeiro do vilão:"
      STDOUT.flush
      novo_nome_verdadeiro = gets.chomp
      listar_localizacoes
      puts "Digite o novo ID da Localização:"
      STDOUT.flush
      novo_id_localizacao = gets.chomp
      puts "Digite o novo nível de periculosidade:"
      STDOUT.flush
      novo_nivel_periculosidade = gets.chomp

      collection.update_one({"_id" => id_vilao}, {
        "$set" => {
          "nome_vilao" => novo_nome_vilao,
          "nome_verdadeiro" => novo_nome_verdadeiro,
          "localizacao" => novo_id_localizacao,
          "nivel_periculosidade" => novo_nivel_periculosidade
        }
      })

      data = recupera_vilao(id_vilao)
      vilao_atualizado = Vilao.new(data[0]['_id'], data[0]['nome_vilao'], data[0]['nome_verdadeiro'], data[0]['localizacao'], data[0]['nivel_periculosidade'])
      puts vilao_atualizado.to_s
      vilao_atualizado
    else
      puts "O ID #{id_vilao} não existe"
      nil
    end
  end

  def excluir_vilao
    database = @connection.connect
    collection = database.database[:viloes]

    puts "Digite o ID do vilão que deseja excluir:"
    STDOUT.flush
    id_vilao = gets.chomp

    if verifica_existencia_vilao(id_vilao)
      data = recupera_vilao(id_vilao)
      vilao = Vilao.new(data[0]['_id'], data[0]['nome_vilao'], data[0]['nome_verdadeiro'], data[0]['localizacao'], data[0]['nivel_periculosidade'])
      collection.delete_one({"_id" => id_vilao})

      puts "Vilão excluído com sucesso"
      puts vilao.to_s
    else
      puts "Vilão não existe, nenhuma alteração feita"
    end
  end

  def recupera_vilao(id_vilao)
    database = @connection.connect
    collection = database.database[:viloes]
    collection.find({ "_id" => id_vilao }).to_a
  end

  def verifica_existencia_vilao(id_vilao)
    result = recupera_vilao(id_vilao)
    !result.empty?
  end
end