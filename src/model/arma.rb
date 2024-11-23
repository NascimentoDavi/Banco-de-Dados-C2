class Arma

  attr_accessor :id_arma, :tipo_arma, :descricao_arma

  def initialize(id_arma, tipo_arma, descricao_arma)
    @id_arma = id_arma
    @tipo_arma = tipo_arma
    @descricao_arma = descricao_arma
  end

  def to_s
    "ID Arma: #{@id_arma} | Tipo Arma: #{@tipo_arma} | Descricao Arma: #{@descricao_arma}"
  end

end