# Implementação de ORM e ODBC com Python

## 📁 Links para os arquivos

- [Script SQL de criação do banco](tarefas/orm/create_database.sql)
- [Programa de conexão ODBC](operacoes_sql.py)
- [Programa usando Django ORM](atividade_orm.py)

## 🔌 ODBC com Python

ODBC (Open Database Connectivity) é um padrão de acesso a bancos de dados que permite comunicação com diversos SGBDs usando SQL. Em Python:

```python
import pyodbc

conn = pyodbc.connect(
    "DRIVER={PostgreSQL Unicode};"
    "SERVER=localhost;"
    "DATABASE=AtividadesBD;"
    "UID=atividade_user;"
    "PWD=senha123;"
)

cursor = conn.cursor()
cursor.execute("SELECT * FROM projeto")
```
## Vantagens:

- Padronização de acesso a diferentes bancos

- Performance para operações complexas

- Controle fino sobre as queries

## 🏗 ORM com Django
ORM (Object-Relational Mapping) mapeia objetos Python para tabelas do banco de dados. Utilizei o Django ORM:

```python
from django.db import models

class Projeto(models.Model):
    nome = models.CharField(max_length=50)
    responsavel = models.ForeignKey('Funcionario', on_delete=models.SET_NULL, null=True)
```

## Vantagens do Django ORM:

- Abstraction do banco de dados

- Migrações automáticas

- QuerySet API poderosa

- Integração com o ecossistema Django

Framework utilizado: Django (versão 4.2)

## ⚖ Comparação

| Característica  | ODBC    | Django ORM |
|----------------|---------|------------|
| Complexidade   | Baixa   | Média      |
| Performance    | Alta    | Moderada   |
| Produtividade  | Baixa   | Alta       |
| Flexibilidade  | Alta    | Moderada   |
