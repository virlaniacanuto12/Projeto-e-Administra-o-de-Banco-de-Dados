SELECT 
    p.nome AS nome_projeto,
    dp.descricao AS departamento_projeto,
    f.nome AS responsavel_projeto,
    df.descricao AS departamento_responsavel
FROM 
    projeto p
JOIN 
    departamento dp ON p.cod_depto = dp.codigo
JOIN 
    funcionario f ON p.cod_responsavel = f.codigo
JOIN 
    departamento df ON f.cod_depto = df.codigo
ORDER BY 
    p.nome;