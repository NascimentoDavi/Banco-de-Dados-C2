require_relative '../conexions/connection'

def relatorio_viloes_por_localizacao(client)
  database = client.database
  collection_vilao_localizacao = database[:vilao_localizacao]

  pipeline = [
    {
      '$group': {
        '_id': '$localizacao_id',
        'quantidade_viloes': { '$sum': 1 }
      }
    },
    {
      '$lookup': {
        from: 'localizacoes',
        localField: '_id',
        foreignField: '_id',
        as: 'localizacao_detalhes'
      }
    },
    {
      '$unwind': '$localizacao_detalhes'
    },
    {
      '$project': {
        'nome_localizacao': '$localizacao_detalhes.nome_localizacao',
        'quantidade_viloes': 1
      }
    },
    {
      '$sort': { 'quantidade_viloes': -1 }
    }
  ]

  result = collection_vilao_localizacao.aggregate(pipeline).to_a
  result.each do |doc|
    puts "Nome Localização: #{doc['nome_localizacao']}, Quantidade de Vilões: #{doc['quantidade_viloes']}"
  end
end