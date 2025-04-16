SELECT f.nome
FROM funcionario f
WHERE f.salario > (
    SELECT MAX(salario)
    FROM funcionario
    WHERE cod_depto = 2
);