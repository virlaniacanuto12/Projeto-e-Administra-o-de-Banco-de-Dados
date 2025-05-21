import os
import django
from django.conf import settings

# Configuração para usar Django ORM
settings.configure(
    DATABASES={
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'NAME': 'AtividadesBD',
            'USER': 'atividade_user',
            'PASSWORD': 'senha123',
            'HOST': 'localhost',
            'PORT': '5432',
        }
    },
    INSTALLED_APPS=[
        '__main__',  # Permite que o Django reconheça os modelos neste arquivo
    ]
)

django.setup()

# Definindo os modelos
from django.db import models

class Departamento(models.Model):
    nome = models.CharField(max_length=100)
    sigla = models.CharField(max_length=10, unique=True)
    descricao = models.CharField(max_length=250)
    gerente = models.ForeignKey('Funcionario', on_delete=models.SET_NULL, null=True)

    class Meta:
        app_label = '__main__'  

class Funcionario(models.Model):
    nome = models.CharField(max_length=150)
    sexo = models.CharField(max_length=1)
    dt_nasc = models.DateField()
    salario = models.DecimalField(max_digits=10, decimal_places=2)
    supervisor = models.ForeignKey('self', on_delete=models.SET_NULL, null=True)
    depto = models.ForeignKey(Departamento, on_delete=models.SET_NULL, null=True)

    class Meta:
        app_label = '__main__'

class Projeto(models.Model):
    nome = models.CharField(max_length=50, unique=True)
    descricao = models.CharField(max_length=250)
    responsavel = models.ForeignKey(Funcionario, on_delete=models.SET_NULL, null=True)
    depto = models.ForeignKey(Departamento, on_delete=models.SET_NULL, null=True)
    data_inicio = models.DateField()
    data_fim = models.DateField()

    class Meta:
        app_label = '__main__'

class Atividade(models.Model):
    descricao = models.CharField(max_length=250)
    projeto = models.ForeignKey(Projeto, on_delete=models.SET_NULL, null=True)
    data_inicio = models.DateField()
    data_fim = models.DateField()

    class Meta:
        app_label = '__main__'

# Criando tabelas no banco de dados, mesmo do migrate
from django.db import connection
with connection.schema_editor() as schema_editor:
    schema_editor.create_model(Departamento)
    schema_editor.create_model(Funcionario)
    schema_editor.create_model(Projeto)
    schema_editor.create_model(Atividade)

