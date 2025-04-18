WITH projetos_atividades AS (
    SELECT
        p.nome AS nome_projeto,
        p.data_inicio AS inicio_projeto,
        p.data_fim AS fim_projeto,
        a.nome AS nome_atividade,
        a.data_inicio AS inicio_atividade,
        a.data_fim AS fim_atividade
    FROM
        projeto p 
    JOIN
        atividade a ON p.codigo = a.codigo
)
SELECT
    nome_projeto,
    inicio_projeto,
    fim_projeto,
    nome_atividade,
    inicio_atividade,
    fim_atividade
FROM
    projetos_atividades
WHERE
    inicio_atividade < inicio_projeto  -- Atividade começa antes do projeto
    OR fim_atividade > fim_projeto    -- Atividade termina depois do projeto
ORDER BY
    nome_projeto, nome_atividade;