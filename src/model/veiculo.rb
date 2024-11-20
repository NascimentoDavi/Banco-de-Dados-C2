class Veiculo

  attr_accessor :id_veiculo, :tipo_veiculo, :descricao_veiculo

  def initialize(id_veiculo, tipo_veiculo, descricao_veiculo)
    @id_veiculo = id_veiculo
    @tipo_veiculo = tipo_veiculo
    @descricao_veiculo = descricao_veiculo
  end

  def to_s
    "Veículo: #{@tipo_veiculo} | Descrição: #{@descricao_veiculo}"
  end
end
