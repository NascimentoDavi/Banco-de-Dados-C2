-- Relatório 3: Contagem de vilões por localização
SELECT 
    l.Nome_Localizacao,
    COUNT(v.ID_Vilao) AS Quantidade_Viloes
FROM 
    Localizacao l
LEFT JOIN 
    Vilao v ON l.ID_Localizacao = v.Localizacao
GROUP BY 
    l.Nome_Localizacao
ORDER BY 
    Quantidade_Viloes DESC
