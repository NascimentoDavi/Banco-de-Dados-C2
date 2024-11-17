class Vilao
  
  def initialize(id_vilao = nil, nome_vilao = nil, nome_verdadeiro = nil, localizacao = nil, nivel_periculosidade = nil)
    set_id_vilao(id_vilao)
    set_nome_vilao(nome_vilao)
    set_nome_verdadeiro(nome_verdadeiro)
    set_localizacao(localizacao)
    set_nivel_periculosidade(nivel_periculosidade)
  end

  def set_id_vilao(id_vilao)
    @id_vilao = id_vilao
  end

  def set_nome_vilao(nome_vilao)
    @nome_vilao = nome_vilao
  end

  def set_nome_verdadeiro(nome_verdadeiro)
    @nome_verdadeiro = nome_verdadeiro
  end

  def set_localizacao(localizacao)
    @localizacao = localizacao
  end

  def set_nivel_periculosidade(nivel_periculosidade)
    @nivel_periculosidade = nivel_periculosidade
  end

  def get_id_vilao
    @id_vilao
  end

  def get_nome_vilao
    @nome_vilao
  end

  def get_nome_verdadeiro
    @nome_verdadeiro
  end

  def get_localizacao
    @localizacao
  end

  def get_nivel_periculosidade
    @nivel_periculosidade
  end

  def to_string
    "Vilão: #{get_nome_vilao} | Nome Verdadeiro: #{get_nome_verdadeiro} | Localização: #{get_localizacao.get_nome_localizacao} | Periculosidade: #{get_nivel_periculosidade}"
  end
end
