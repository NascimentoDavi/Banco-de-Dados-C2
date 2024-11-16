class Veiculo
  
  def initialize(id_veiculo = nil, tipo_veiculo = nil, descricao_veiculo = nil)
    set_id_veiculo(id_veiculo)
    set_tipo_veiculo(tipo_veiculo)
    set_descricao_veiculo(descricao_veiculo)
  end

  def set_id_veiculo(id_veiculo)
    @id_veiculo = id_veiculo
  end

  def set_tipo_veiculo(tipo_veiculo)
    @tipo_veiculo = tipo_veiculo
  end

  def set_descricao_veiculo(descricao_veiculo)
    @descricao_veiculo = descricao_veiculo
  end

  def get_id_veiculo
    @id_veiculo
  end

  def get_tipo_veiculo
    @tipo_veiculo
  end

  def get_descricao_veiculo
    @descricao_veiculo
  end

  def to_string
    "Veículo: #{get_tipo_veiculo} | Descrição: #{get_descricao_veiculo}"
  end
end
