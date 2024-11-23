require_relative '../conexions/connection'

def relatorio_detalhado_vilao_arma_veiculo_localizacao(client)
  database = client.database
  collection_vilao = database[:viloes]
  collection_vilao_localizacao = database[:vilao_localizacao]
  collection_localizacao = database[:localizacoes]
  collection_vilao_arma = database[:vilao_arma]
  collection_arma = database[:arma]
  collection_vilao_veiculo = database[:vilao_veiculo]
  collection_veiculo = database[:veiculos]

  pipeline = [
    {
      '$lookup': {
        from: 'vilao_localizacao',
        localField: '_id',
        foreignField: 'vilao_id',
        as: 'localizacoes'
      }
    },
    {
      '$lookup': {
        from: 'localizacoes',
        localField: 'localizacoes.localizacao_id',
        foreignField: '_id',
        as: 'localizacao_detalhes'
      }
    },
    {
      '$lookup': {
        from: 'vilao_arma',
        localField: '_id',
        foreignField: 'vilao_id',
        as: 'armas'
      }
    },
    {
      '$lookup': {
        from: 'arma',
        localField: 'armas.arma_id',
        foreignField: '_id',
        as: 'armas_detalhes'
      }
    },
    {
      '$lookup': {
        from: 'vilao_veiculo',
        localField: '_id',
        foreignField: 'vilao_id',
        as: 'veiculos'
      }
    },
    {
      '$lookup': {
        from: 'veiculos',
        localField: 'veiculos.veiculo_id',
        foreignField: '_id',
        as: 'veiculos_detalhes'
      }
    },
    {
      '$project': {
        'nome_vilao': 1,
        'nome_verdadeiro': 1,
        'localizacao_detalhes.nome_localizacao': 1,
        'armas_detalhes.tipo': 1,
        'veiculos_detalhes.tipo_veiculo': 1
      }
    },
    {
      '$sort': { 'nome_vilao': 1 }
    }
  ]

  result = collection_vilao.aggregate(pipeline).to_a
  result.each do |doc|
    localizacoes = doc['localizacao_detalhes'].map { |loc| loc['nome_localizacao'] }.join(', ')
    armas = doc['armas_detalhes'].map { |arma| arma['tipo'] }.join(', ')
    veiculos = doc['veiculos_detalhes'].map { |veiculo| veiculo['tipo_veiculo'] }.join(', ')
    puts "Nome Vilão: #{doc['nome_vilao']}, Nome Verdadeiro: #{doc['nome_verdadeiro']}, Localizações: #{localizacoes}, Armas: #{armas}, Veículos: #{veiculos}"
  end
end