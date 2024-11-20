class VilaoVeiculo

  attr_accessor :vilao_id, :veiculo_id

  def initialize(vilao_id, veiculo_id)
    @vilao_id = vilao_id
    @veiculo_id = veiculo_id
  end


  def to_string
    "Vilão ID: #{@vilao_id} | Veículo ID: #{@veiculo_id}"
  end
end