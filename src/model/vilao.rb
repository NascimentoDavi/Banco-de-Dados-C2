class Vilao
  attr_accessor :id_vilao, :nome_vilao, :nome_verdadeiro, :nivel_periculosidade

  def initialize(id_vilao, nome_vilao, nome_verdadeiro, nivel_periculosidade)
    @id_vilao = id_vilao
    @nome_vilao = nome_vilao
    @nome_verdadeiro = nome_verdadeiro
    @nivel_periculosidade = nivel_periculosidade
  end

  def to_s
    "Vilão: #{@nome_vilao} | Nome Verdadeiro: #{@nome_verdadeiro} | Periculosidade: #{@nivel_periculosidade}"
  end
end