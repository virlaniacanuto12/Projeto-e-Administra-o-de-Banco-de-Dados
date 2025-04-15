-- Limpa as tabelas 
TRUNCATE TABLE atividade_projeto CASCADE;
TRUNCATE TABLE atividade CASCADE;
TRUNCATE TABLE projeto CASCADE;
TRUNCATE TABLE funcionario CASCADE;
TRUNCATE TABLE departamento CASCADE;

INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'Departamento de Tecnologia', NULL),
(2, 'Departamento de Recursos Humanos', NULL),
(3, 'Departamento Financeiro', NULL),
(4, 'Departamento Comercial', NULL),
(5, 'Departamento de Operações', NULL);

INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto) VALUES
(1, 'João Silva', 'M', '1985-03-15', 7500.00, 1),
(2, 'Maria Santos', 'F', '1990-07-22', 38200.00, 2),
(3, 'Carlos Oliveira', 'M', '1982-11-30', 6800.00, 1),
(4, 'Ana Pereira', 'F', '1992-05-10', 7100.00, 3),
(5, 'Pedro Costa', 'M', '1988-09-18', 6500.00, 4);

-- Atualiza gerentes
UPDATE departamento SET cod_gerente = 1 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 2 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 4 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 5 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 3 WHERE codigo = 5;

INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Sistema de Gestão', 'Desenvolvimento de sistema ERP', 1, 1, '2023-01-15', '2023-12-20'),
(2, 'Treinamento de Liderança', 'Capacitação de gestores', 2, 2, '2023-03-10', '2023-05-30'),
(3, 'Otimização Financeira', 'Revisão de processos financeiros', 3, 4, '2023-02-01', '2023-06-15'),
(4, 'Expansão Comercial', 'Abertura de novas filiais', 4, 5, '2023-04-05', '2023-11-30'),
(5, 'Automação de Processos', 'Implementação de RPA', 1, 3, '2023-05-20', '2023-09-10');

INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Modelagem do Banco', 'Criação do modelo de dados', 1, '2023-01-15', '2023-02-28'),
(2, 'Desenvolvimento Frontend', 'Implementação da interface', 3, '2023-03-01', '2023-06-30'),
(3, 'Treinamento Inicial', 'Treinamento para novos gestores', 2, '2023-03-10', '2023-04-15'),
(4, 'Análise de Custos', 'Identificação de oportunidades', 4, '2023-02-01', '2023-03-31'),
(5, 'Pesquisa de Mercado', 'Avaliação de novas localidades', 5, '2023-04-05', '2023-06-20');

INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);