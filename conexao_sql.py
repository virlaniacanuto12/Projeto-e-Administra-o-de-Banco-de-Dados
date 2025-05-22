import psycopg2

# Configurações de conexão (ajuste conforme seu Docker)
conn = psycopg2.connect(
    host="localhost",         
    database="AtividadesBD",
    user="atividade_user",
    password="senha123",
    port="5432"
)

def executar_sql(sql):
    cursor = conn.cursor()
    try:
        cursor.execute(sql)
        conn.commit()
        print("Comando executado com sucesso!")
        return cursor.fetchall() if "SELECT" in sql else None
    except Exception as e:
        conn.rollback()
        print(f"Erro ao executar SQL: {e}")
    finally:
        cursor.close()

def fechar_conexao():
    conn.close()