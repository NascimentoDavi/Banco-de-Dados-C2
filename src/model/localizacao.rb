class Localizacao

  attr_accessor :id_localizacao, :tipo_localizacao, :nome_localizacao

  def initialize(id_localizacao, nome_localizacao, tipo_localizacao)
    @id_localizacao = id_localizacao
    @nome_localizacao = nome_localizacao
    @tipo_localizacao = tipo_localizacao
  end

  def to_s
    "Localização: #{@nome_localizacao} | Tipo: #{@tipo_localizacao}"
  end
end