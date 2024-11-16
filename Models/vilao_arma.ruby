class VilaoArma

  def initialize(vilao_id = nil, arma_id = nil)
    set_vilao_id(vilao_id)
    set_arma_id(arma_id)
  end

  def set_vilao_id(vilao_id)
    @vilao_id = vilao_id
  end

  def set_arma_id(arma_id)
    @arma_id = arma_id
  end

  def get_vilao_id
    @vilao_id
  end

  def get_arma_id
    @arma_id
  end

  def to_string
    "Vilão ID: #{get_vilao_id} | Arma ID: #{get_arma_id}"
  end
end
