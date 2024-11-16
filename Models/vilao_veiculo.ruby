class VilaoVeiculo

  def initialize(vilao_id = nil, veiculo_id = nil)
    set_vilao_id(vilao_id)
    set_veiculo_id(veiculo_id)
  end

  def set_vilao_id(vilao_id)
    @vilao_id = vilao_id
  end

  def set_veiculo_id(veiculo_id)
    @veiculo_id = veiculo_id
  end

  def get_vilao_id
    @vilao_id
  end

  def get_veiculo_id
    @veiculo_id
  end

  def to_string
    "Vilão ID: #{get_vilao_id} | Veículo ID: #{get_veiculo_id}"
  end
end