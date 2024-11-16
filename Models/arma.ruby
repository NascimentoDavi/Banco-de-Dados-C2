class Arma 

  def initialize(id_arma = nil, tipo_arma = nil, descricao_arma=nil)
    set_id_arma(id_arma)
    set_tipo_arma(tipo_arma)
    set_descricao_arma(descricao_arma)
  end

  def get_id_arma
    @id_arma
  end

  def get_tipo_arma
    @tipo_arma
  end

  def get_descricao_arma
    @descricao_arma
  end

  def set_id_arma(id_arma)
    @id_arma = id_arma
  end

  def set_tipo_arma(tipo_arma)
    @set_tipo_arma = tipo_arma
  end

  def set_descricao_arma(descricao_arma)
    @descricao_arma = descricao_arma
  end

  def to_string
    "ID Arma: #{get_id_arma} | Tipo Arma: #{get_tipo_arma} | Descricao Arma: #{get_descricao_arma}"
  end

end