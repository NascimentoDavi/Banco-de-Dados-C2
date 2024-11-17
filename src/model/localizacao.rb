class Localizacao
  
  def initialize(id_localizacao = nil, nome_localizacao = nil, tipo_localizacao = nil)
    set_id_localizacao(id_localizacao)
    set_nome_localizacao(nome_localizacao)
    set_tipo_localizacao(tipo_localizacao)
  end

  def get_id_localizacao
    @id_localizacao
  end

  def get_nome_localizacao
    @nome_localizacao
  end

  def get_tipo_localizacao
    @tipo_localizacao
  end

  def set_id_localizacao(id_localizacao)
    @id_localizacao = id_localizacao
  end

  def set_nome_localizacao(nome_localizacao)
    @nome_localizacao = nome_localizacao
  end

  def set_tipo_localizacao(tipo_localizacao)
    @tipo_localizacao = tipo_localizacao
  end

  def to_string
    "Localização: #{get_nome_localizacao} | Tipo: #{get_tipo_localizacao}"
  end
end