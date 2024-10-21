SELECT 
    v.Nome_Vilao,
    COUNT(DISTINCT va.ID_Arma) AS Quantidade_Armas,
    COUNT(DISTINCT vv.ID_Veiculo) AS Quantidade_Veiculos
FROM 
    Vilao v
LEFT JOIN 
    Vilao_Arma va ON v.ID_Vilao = va.ID_Vilao
LEFT JOIN 
    Vilao_Veiculo vv ON v.ID_Vilao = vv.ID_Vilao
GROUP BY 
    v.Nome_Vilao
ORDER BY 
    v.Nome_Vilao
