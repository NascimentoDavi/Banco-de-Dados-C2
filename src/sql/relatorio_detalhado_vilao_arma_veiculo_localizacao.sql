-- Relatório 4: Detalhamento completo de vilões, armas, veículos e localização
SELECT 
    v.Nome_Vilao,
    v.Nome_Verdadeiro,
    l.Nome_Localizacao,
    a.Tipo_Arma,
    ve.Tipo_Veiculo
FROM 
    Vilao v
LEFT JOIN 
    Localizacao l ON v.Localizacao = l.ID_Localizacao
LEFT JOIN 
    Vilao_Arma va ON v.ID_Vilao = va.ID_Vilao
LEFT JOIN 
    Arma a ON va.ID_Arma = a.ID_Arma
LEFT JOIN 
    Vilao_Veiculo vv ON v.ID_Vilao = vv.ID_Vilao
LEFT JOIN 
    Veiculo ve ON vv.ID_Veiculo = ve.ID_Veiculo
ORDER BY 
    v.Nome_Vilao
