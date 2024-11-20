class VilaoArma

  attr_accessor :vilao_id, :arma_id

  def initialize(vilao_id, arma_id)
    @vilao_id = vilao_id
    @arma_id = arma_id
  end

  def to_s
    "Vilão ID: #{@vilao_id} | Arma ID: #{@arma_id}"
  end
end
