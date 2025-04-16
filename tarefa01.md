# Explicação sobre JOINs e Window Functions no PostgreSQL

## JOINs

### NATURAL JOIN

O `NATURAL JOIN` automaticamente junta tabelas baseando-se em colunas com o mesmo nome.

```sql
-- Exemplo 1: Juntando tabelas com colunas 'id' em comum
SELECT *
FROM funcionarios
NATURAL JOIN departamentos;

-- Exemplo 2: Com filtro adicional
SELECT *
FROM produtos
NATURAL JOIN categorias
WHERE preco > 100;
```

### CROSS JOIN (Produto Cartesiano)

No SQL, o CROSS JOIN é uma junção que combina cada linha de uma tabela com cada linha de outra tabela. É também conhecido como junção cartesiana. 

```sql 
-- Exemplo básico combinando todas as linhas de duas tabelas
SELECT *
FROM clientes
CROSS JOIN produtos;

-- CROSS JOIN com filtros WHERE
SELECT p.nome_produto, c.nome_cliente
FROM produtos p
CROSS JOIN clientes c
WHERE p.categoria = 'Eletrônicos';

-- CROSS JOIN com múltiplas tabelas
SELECT f.funcionario, d.departamento, p.projeto
FROM funcionarios f
CROSS JOIN departamentos d
CROSS JOIN projetos p;
```

### Window Functions no PostgreSQL

Window Functions permitem realizar cálculos em um conjunto de linhas relacionadas à linha atual, sem agrupar as linhas em uma única saída.

#### Características principais:

- Usam a cláusula `OVER()`
- Mantêm as linhas originais na saída
- Podem particionar dados com `PARTITION BY`
- Podem ordenar com `ORDER BY`

### Exemplo comum

```sql
-- Ranking
SELECT name, salary, 
       RANK() OVER (ORDER BY salary DESC) as salary_rank
FROM employees;

-- Soma acumulada
SELECT date, revenue,
       SUM(revenue) OVER (ORDER BY date) as running_total
FROM sales;

-- Particionado por departamento
SELECT name, department, salary,
       AVG(salary) OVER (PARTITION BY department) as avg_dept_salary
FROM employees;
```