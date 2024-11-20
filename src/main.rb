require_relative 'conexions/connection'
require_relative 'controller/controller_vilao'
require_relative 'controller/controller_arma'
require_relative 'controller/controller_veiculo'
require_relative 'controller/controller_vilao_arma'
require_relative 'controller/controller_vilao_veiculo'

def verificar_colecoes(client)
  database = client.database
  colecoes_necessarias = ['viloes', 'arma', 'veiculos', 'vilao_arma', 'vilao_veiculo']
  colecoes_presentes = database.collection_names

  colecoes_necessarias.each do |colecao|
    unless colecoes_presentes.include?(colecao)
      puts "Coleção #{colecao} não encontrada no banco de dados."
      return false
    end
  end

  puts "Todas as coleções necessárias estão presentes no banco de dados."
  true
end

def main
  # Teste de conexão
  begin
    config_file = 'conexions/info/login.json'
    connection = Connection.new(config_file)
    client = connection.connect
    puts "Conexão com o banco de dados estabelecida com sucesso."
  rescue => e
    puts "Erro ao conectar ao banco de dados: #{e.message}"
    return
  end

  # Verificar coleções
  unless verificar_colecoes(client)
    puts "Erro: Nem todas as coleções necessárias estão presentes no banco de dados."
    return
  end

  # Teste Controller_vilao
  begin
    controller_vilao = Controller_vilao.new
    puts "Controller_vilao instanciado com sucesso."
  rescue => e
    puts "Erro ao instanciar Controller_vilao: #{e.message}"
    return
  end

  # Teste Controller_arma
  begin
    controller_arma = Controller_arma.new
    puts "Controller_arma instanciado com sucesso."
  rescue => e
    puts "Erro ao instanciar Controller_arma: #{e.message}"
    return
  end

  # Teste Controller_veiculo
  begin
    controller_veiculo = Controller_veiculo.new
    puts "Controller_veiculo instanciado com sucesso."
  rescue => e
    puts "Erro ao instanciar Controller_veiculo: #{e.message}"
    return
  end

  # Teste Controller_vilao_arma
  begin
    controller_vilao_arma = Controller_vilao_arma.new
    puts "Controller_vilao_arma instanciado com sucesso."
  rescue => e
    puts "Erro ao instanciar Controller_vilao_arma: #{e.message}"
    return
  end

  # Teste Controller_vilao_veiculo
  begin
    controller_vilao_veiculo = Controller_vilao_veiculo.new
    puts "Controller_vilao_veiculo instanciado com sucesso."
  rescue => e
    puts "Erro ao instanciar Controller_vilao_veiculo: #{e.message}"
    return
  end

  # Teste de inserção e verificação de existência
  begin
    puts "Inserindo vilão..."
    STDOUT.flush
    controller_vilao.inserir_vilao
    puts "Atualizando vilão..."
    STDOUT.flush
    controller_vilao.atualizar_vilao
    puts "Excluindo vilão..."
    STDOUT.flush
    controller_vilao.excluir_vilao

    puts "Inserindo arma..."
    STDOUT.flush
    controller_arma.inserir_arma
    puts "Atualizando arma..."
    STDOUT.flush
    controller_arma.atualizar_arma
    puts "Excluindo arma..."
    STDOUT.flush
    controller_arma.excluir_arma

    puts "Inserindo veículo..."
    STDOUT.flush
    controller_veiculo.inserir_veiculo
    puts "Atualizando veículo..."
    STDOUT.flush
    controller_veiculo.atualizar_veiculo
    puts "Excluindo veículo..."
    STDOUT.flush
    controller_veiculo.excluir_veiculo

    puts "Inserindo associação vilão-arma..."
    STDOUT.flush
    controller_vilao_arma.inserir_vilao_arma
    puts "Excluindo associação vilão-arma..."
    STDOUT.flush
    controller_vilao_arma.excluir_vilao_arma

    puts "Inserindo associação vilão-veículo..."
    STDOUT.flush
    controller_vilao_veiculo.inserir_vilao_veiculo
    puts "Excluindo associação vilão-veículo..."
    STDOUT.flush
    controller_vilao_veiculo.excluir_vilao_veiculo
  rescue => e
    puts "Erro durante a execução dos testes: #{e.message}"
  end
end

# Execute o programa
main