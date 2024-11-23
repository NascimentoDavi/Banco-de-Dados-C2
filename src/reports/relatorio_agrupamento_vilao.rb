require_relative '../conexions/connection'

def relatorio_agrupamento_vilao(client)
  database = client.database
  collection_vilao = database[:viloes]
  collection_vilao_arma = database[:vilao_arma]
  collection_vilao_veiculo = database[:vilao_veiculo]

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
        from: 'vilao_veiculo',
        localField: '_id',
        foreignField: 'vilao_id',
        as: 'veiculos'
      }
    },
    {
      '$project': {
        'nome_vilao': 1,
        'quantidade_armas': { '$size': { '$ifNull': ['$armas', []] } },
        'quantidade_veiculos': { '$size': { '$ifNull': ['$veiculos', []] } }
      }
    },
    {
      '$sort': { 'nome_vilao': 1 }
    }
  ]

  result = collection_vilao.aggregate(pipeline).to_a
  result.each do |doc|
    puts "Nome Vilão: #{doc['nome_vilao']}, Quantidade de Armas: #{doc['quantidade_armas']}, Quantidade de Veículos: #{doc['quantidade_veiculos']}"
  end
end
