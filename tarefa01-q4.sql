DROP VIEW IF EXISTS view_funcionarios_nao_gerentes;

CREATE VIEW view_funcionarios_nao_gerentes AS
SELECT 
    f.codigo,
    f.nome,
    f.sexo,
    f.dt_nasc,
    f.salario,
    d.descricao AS departamento
FROM 
    funcionario f
JOIN 
    departamento d ON f.cod_depto = d.codigo
WHERE 
    f.codigo NOT IN (
        SELECT cod_gerente 
        FROM departamento 
        WHERE cod_gerente IS NOT NULL
    )
ORDER BY 
    f.nome;