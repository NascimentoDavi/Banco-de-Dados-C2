-- Relatório 2: Vilões, Armas e Veículos associados
SELECT 
    v.Nome_Vilao,
    a.Tipo_Arma,
    ve.Tipo_Veiculo
FROM 
    Vilao v
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
