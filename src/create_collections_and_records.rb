require_relative 'conexions/connection'

def create_collections(client)
  database = client.database
  colecoes_necessarias = ['viloes', 'arma', 'veiculos', 'vilao_arma', 'vilao_veiculo']

  colecoes_necessarias.each do |colecao|
    if database.collection_names.include?(colecao)
      database[colecao].drop
      puts "Coleção #{colecao} excluída com sucesso."
    end
    database.command(create: colecao)
    puts "Coleção #{colecao} criada com sucesso."
  end
end

def inserir_viloes(client)
  collection = client.database[:viloes]

  viloes = [
    { "_id" => "1", "nome_vilao" => "Coringa", "nome_verdadeiro" => "Desconhecido", "localizacao" => "Gotham", "nivel_periculosidade" => "Alto" },
    { "_id" => "2", "nome_vilao" => "Lex Luthor", "nome_verdadeiro" => "Alexander Joseph Luthor", "localizacao" => "Metropolis", "nivel_periculosidade" => "Alto" },
    { "_id" => "3", "nome_vilao" => "Duas-Caras", "nome_verdadeiro" => "Harvey Dent", "localizacao" => "Gotham", "nivel_periculosidade" => "Médio" },
    { "_id" => "4", "nome_vilao" => "Charada", "nome_verdadeiro" => "Edward Nigma", "localizacao" => "Gotham", "nivel_periculosidade" => "Médio" },
    { "_id" => "5", "nome_vilao" => "Pinguim", "nome_verdadeiro" => "Oswald Cobblepot", "localizacao" => "Gotham", "nivel_periculosidade" => "Médio" }
  ]

  viloes.each do |vilao|
    unless collection.find({ "_id" => vilao["_id"] }).to_a.empty?
      puts "Vilão com ID #{vilao["_id"]} já existe."
    else
      collection.insert_one(vilao)
      puts "Vilão #{vilao["nome_vilao"]} inserido com sucesso."
    end
  end
end

def inserir_armas(client)
  collection = client.database[:arma]

  armas = [
    { "_id" => "1", "tipo" => "Pistola", "descricao" => "Pistola automática" },
    { "_id" => "2", "tipo" => "Rifle", "descricao" => "Rifle de precisão" },
    { "_id" => "3", "tipo" => "Faca", "descricao" => "Faca de combate" }
  ]

  armas.each do |arma|
    unless collection.find({ "_id" => arma["_id"] }).to_a.empty?
      puts "Arma com ID #{arma["_id"]} já existe."
    else
      collection.insert_one(arma)
      puts "Arma #{arma["tipo"]} inserida com sucesso."
    end
  end
end

def inserir_veiculos(client)
  collection = client.database[:veiculos]

  veiculos = [
    { "_id" => "1", "tipo_veiculo" => "Carro", "descricao_veiculo" => "Carro esportivo" },
    { "_id" => "2", "tipo_veiculo" => "Moto", "descricao_veiculo" => "Moto rápida" },
    { "_id" => "3", "tipo_veiculo" => "Helicóptero", "descricao_veiculo" => "Helicóptero de ataque" }
  ]

  veiculos.each do |veiculo|
    unless collection.find({ "_id" => veiculo["_id"] }).to_a.empty?
      puts "Veículo com ID #{veiculo["_id"]} já existe."
    else
      collection.insert_one(veiculo)
      puts "Veículo #{veiculo["tipo_veiculo"]} inserido com sucesso."
    end
  end
end

def inserir_vilao_arma(client)
  collection = client.database[:vilao_arma]

  vilao_armas = [
    { "vilao_id" => "1", "arma_id" => "1" },
    { "vilao_id" => "2", "arma_id" => "2" },
    { "vilao_id" => "3", "arma_id" => "3" }
  ]

  vilao_armas.each do |va|
    unless collection.find({ "vilao_id" => va["vilao_id"], "arma_id" => va["arma_id"] }).to_a.empty?
      puts "Associação Vilão #{va["vilao_id"]} com Arma #{va["arma_id"]} já existe."
    else
      collection.insert_one(va)
      puts "Associação Vilão #{va["vilao_id"]} com Arma #{va["arma_id"]} inserida com sucesso."
    end
  end
end

def inserir_vilao_veiculo(client)
  collection = client.database[:vilao_veiculo]

  vilao_veiculos = [
    { "vilao_id" => "1", "veiculo_id" => "1" },
    { "vilao_id" => "2", "veiculo_id" => "2" },
    { "vilao_id" => "3", "veiculo_id" => "3" }
  ]

  vilao_veiculos.each do |vv|
    unless collection.find({ "vilao_id" => vv["vilao_id"], "veiculo_id" => vv["veiculo_id"] }).to_a.empty?
      puts "Associação Vilão #{vv["vilao_id"]} com Veículo #{vv["veiculo_id"]} já existe."
    else
      collection.insert_one(vv)
      puts "Associação Vilão #{vv["vilao_id"]} com Veículo #{vv["veiculo_id"]} inserida com sucesso."
    end
  end
end

def main
  # Conectar ao banco de dados
  begin
    config_file = 'conexions/info/login.json'
    connection = Connection.new(config_file)
    client = connection.connect
    puts "Conexão com o banco de dados estabelecida com sucesso."
  rescue => e
    puts "Erro ao conectar ao banco de dados: #{e.message}"
    return
  end

  # Criar coleções
  begin
    create_collections(client)
  rescue => e
    puts "Erro ao criar coleções: #{e.message}"
  end

  # Inserir registros
  begin
    inserir_viloes(client)
    inserir_armas(client)
    inserir_veiculos(client)
    inserir_vilao_arma(client)
    inserir_vilao_veiculo(client)
  rescue => e
    puts "Erro ao inserir registros: #{e.message}"
  ensure
    connection.disconnect
  end
end

# Execute o programa
main