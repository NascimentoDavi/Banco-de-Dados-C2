require_relative 'conexions/connection'
require_relative 'controller/controller_vilao'
require_relative 'controller/controller_arma'
require_relative 'controller/controller_veiculo'
require_relative 'controller/controller_vilao_arma'
require_relative 'controller/controller_vilao_veiculo'
require_relative 'controller/controller_vilao_localizacao'
require_relative 'controller/controller_localizacao'
require_relative 'reports/relatorio_agrupamento_vilao'
require_relative 'reports/relatorio_viloes_por_localizacao'
require_relative 'reports/relatorio_juncao_arma_veiculo'
require_relative 'reports/relatorio_detalhado_vilao_arma_veiculo_localizacao'

def verificar_colecoes(client)
  database = client.database
  colecoes_necessarias = ['viloes', 'arma', 'veiculos', 'vilao_arma', 'vilao_veiculo', 'localizacoes', 'vilao_localizacao']
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

def reports(opcao_relatorio, client)
  case opcao_relatorio
  when 1
    puts "Executando relatório de contagem de armas e veículos por vilão..."
    relatorio_agrupamento_vilao(client)
  when 2
    puts "Executando relatório de armas e veículos associados a cada vilão..."
    relatorio_juncao_vilao_arma_veiculo(client)
  when 3
    puts "Executando relatório de contagem de vilões por localização..."
    relatorio_viloes_por_localizacao(client)
  when 4
    puts "Executando relatório de detalhamento completo de vilões, armas, veículos e localização..."
    relatorio_detalhado_vilao_arma_veiculo_localizacao(client)
  else
    puts "Opção inválida."
  end
end

def inserir(opcao_inserir, client)
  case opcao_inserir
  when 1
    puts "Inserindo vilão..."
    Controller_vilao.new.inserir_vilao
  when 2
    puts "Inserindo arma..."
    Controller_arma.new.inserir_arma
  when 3
    puts "Inserindo veículo..."
    Controller_veiculo.new.inserir_veiculo
  when 4
    puts "Inserindo associação vilão-arma..."
    Controller_vilao_arma.new.inserir_vilao_arma
  when 5
    puts "Inserindo associação vilão-veículo..."
    Controller_vilao_veiculo.new.inserir_vilao_veiculo
  when 6
    puts "Inserindo associação vilão-localização..."
    Controller_vilao_localizacao.new.inserir_vilao_localizacao
  when 7
    puts "Inserindo localização..."
    Controller_localizacao.new.inserir_localizacao
  else
    puts "Opção inválida."
  end
end

def atualizar(opcao_atualizar, client)
  case opcao_atualizar
  when 1
    puts "Atualizando vilão..."
    Controller_vilao.new.atualizar_vilao
  when 2
    puts "Atualizando arma..."
    Controller_arma.new.atualizar_arma
  when 3
    puts "Atualizando veículo..."
    Controller_veiculo.new.atualizar_veiculo
  when 4
    puts "Atualizando localização..."
    Controller_localizacao.new.atualizar_localizacao
  else
    puts "Opção inválida."
  end
end

def excluir(opcao_excluir, client)
  case opcao_excluir
  when 1
    puts "Excluindo vilão..."
    Controller_vilao.new.excluir_vilao
  when 2
    puts "Excluindo arma..."
    Controller_arma.new.excluir_arma
  when 3
    puts "Excluindo veículo..."
    Controller_veiculo.new.excluir_veiculo
  when 4
    puts "Excluindo associação vilão-arma..."
    Controller_vilao_arma.new.excluir_vilao_arma
  when 5
    puts "Excluindo associação vilão-veículo..."
    Controller_vilao_veiculo.new.excluir_vilao_veiculo
  when 6
    puts "Excluindo associação vilão-localização..."
    Controller_vilao_localizacao.new.excluir_vilao_localizacao
  when 7
    puts "Excluindo localização..."
    Controller_localizacao.new.excluir_localizacao
  else
    puts "Opção inválida."
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

  # Verificar coleções
  unless verificar_colecoes(client)
    puts "Erro: Nem todas as coleções necessárias estão presentes no banco de dados."
    return
  end

  loop do
    puts "Menu Principal"
    puts "1 - Relatórios"
    puts "2 - Inserir Registros"
    puts "3 - Atualizar Registros"
    puts "4 - Remover Registros"
    puts "5 - Sair"
    print "Escolha uma opção: "
    STDOUT.flush
    opcao = gets.chomp.to_i

    case opcao
    when 1
      puts "Relatórios"
      puts "1 - Relatório de contagem de armas e veículos por vilão"
      puts "2 - Relatório de armas e veículos associados a cada vilão"
      puts "3 - Relatório de contagem de vilões por localização"
      puts "4 - Relatório de detalhamento completo de vilões, armas, veículos e localização"
      puts "0 - Sair"
      print "Escolha uma opção: "
      STDOUT.flush
      opcao_relatorio = gets.chomp.to_i
      reports(opcao_relatorio, client)
    when 2
      puts "ENTIDADES"
      puts "1 - VILOES"
      puts "2 - ARMAS"
      puts "3 - VEICULOS"
      puts "4 - ARMAS DE VILOES"
      puts "5 - VEICULOS DE VILOES"
      puts "6 - LOCALIZAÇÕES DE VILOES"
      puts "7 - LOCALIZAÇÕES"
      print "Escolha uma opção: "
      STDOUT.flush
      opcao_inserir = gets.chomp.to_i
      inserir(opcao_inserir, client)
    when 3
      puts "ENTIDADES"
      puts "1 - VILOES"
      puts "2 - ARMAS"
      puts "3 - VEICULOS"
      puts "4 - LOCALIZAÇÕES"
      print "Escolha uma opção: "
      STDOUT.flush
      opcao_atualizar = gets.chomp.to_i
      atualizar(opcao_atualizar, client)
    when 4
      puts "ENTIDADES"
      puts "1 - VILOES"
      puts "2 - ARMAS"
      puts "3 - VEICULOS"
      puts "4 - ARMAS DE VILOES"
      puts "5 - VEICULOS DE VILOES"
      puts "6 - LOCALIZAÇÕES DE VILOES"
      puts "7 - LOCALIZAÇÕES"
      print "Escolha uma opção: "
      STDOUT.flush
      opcao_excluir = gets.chomp.to_i
      excluir(opcao_excluir, client)
    when 5
      puts "Obrigado por utilizar o Bat Computador. Tenha um ótimo Bat Dia!"
      break
    else
      puts "Opção inválida, tente novamente."
    end
  end

  connection.disconnect
end

# Execute o programa
main