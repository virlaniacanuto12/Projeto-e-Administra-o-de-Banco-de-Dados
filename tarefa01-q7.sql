CREATE VIEW view_total_funcionarios_depto AS
SELECT 
    d.codigo AS cod_depto,
    d.descricao AS nome_departamento,
    COUNT(f.codigo) AS total_funcionarios
FROM 
    departamento d
LEFT JOIN 
    funcionario f ON d.codigo = f.cod_depto
GROUP BY 
    d.codigo, d.descricao;


SELECT 
    d.descricao AS nome_departamento,
    f.nome AS nome_gerente,
    v.total_funcionarios
FROM 
    departamento d
LEFT JOIN 
    funcionario f ON d.cod_gerente = f.codigo
LEFT JOIN 
    view_total_funcionarios_depto v ON d.codigo = v.cod_depto
ORDER BY 
    d.codigo;