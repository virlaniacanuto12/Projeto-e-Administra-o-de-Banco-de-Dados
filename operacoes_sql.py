from conexao_sql import executar_sql, fechar_conexao

# 1. Inserir uma atividade em algum projeto 
sql_inserir_atividade = """
INSERT INTO atividade (descricao, projeto, data_inicio, data_fim)
VALUES ('Desenvolver módulo de relatórios', 1, '2023-10-10', '2023-10-20');
"""
executar_sql(sql_inserir_atividade)

# 2. Atualizar o líder de um projeto
sql_atualizar_lider = """
UPDATE projeto SET responsavel = 2 WHERE codigo = 1;
"""
executar_sql(sql_atualizar_lider)

# 3. Listar todos os projetos e suas atividades
sql_listar_projetos = """
SELECT p.nome AS projeto, a.descricao AS atividade, 
       a.data_inicio, a.data_fim
FROM projeto p
LEFT JOIN atividade a ON p.codigo = a.projeto;
"""
resultados = executar_sql(sql_listar_projetos)

# Exibir resultados
print("\n=== Projetos e Atividades ===")
for linha in resultados:
    print(f"Projeto: {linha[0]}")
    if linha[1]:  
        print(f"  - Atividade: {linha[1]} ({linha[2]} a {linha[3]})")
    else:
        print("  - Sem atividades registradas.")

fechar_conexao()