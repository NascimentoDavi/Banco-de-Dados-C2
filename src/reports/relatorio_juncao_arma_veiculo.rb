require_relative '../conexions/connection'

def relatorio_juncao_vilao_arma_veiculo(client)
  database = client.database
  collection_vilao = database[:viloes]
  collection_vilao_arma = database[:vilao_arma]
  collection_arma = database[:arma]
  collection_vilao_veiculo = database[:vilao_veiculo]
  collection_veiculo = database[:veiculos]

  pipeline = [
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
    armas = doc['armas_detalhes'].map { |arma| arma['tipo'] }.join(', ')
    veiculos = doc['veiculos_detalhes'].map { |veiculo| veiculo['tipo_veiculo'] }.join(', ')
    puts "Nome Vilão: #{doc['nome_vilao']}, Armas: #{armas}, Veículos: #{veiculos}"
  end
end
