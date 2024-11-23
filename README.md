# Trabalho avaliativo da C3 Banco de Dados

Esse é um projeto desenvolvido para a matéria de banco de dados

---
## Grupo

Membros do grupo:
- Davi Rodrigues
- Luiz Otávio Kuster
- Mateus Reis
- Vinícius Cavati

---

## Como rodar:

### Pré-requisitos

Para rodar o projeto, você precisará ter o Ruby instalado. Além disso, será preciso instalar as dependências do projeto.


```bash
$ gem install mongo
$ gem install json
```

Em caso de falha ao instalar a dependencia ``bson``, você deve instalar a gem bson através do gerenciador de pacotes do seu sistema operacional

Exemplo no Ubuntu:

```bash
$ sudo apt install ruby-bson
```

### Criando as coleções e inserindo registros

Para criar as coleções e inserir os registros iniciais, utilize o comando:

```bash
$ ruby create_collections_and_records.rb
```


### Rodando o projeto

Para iniciar o projeto, você pode rodar o arquivo main.rb com o comando:

```bash
$ ruby main.rb
```

---

## Estrutura de arquivos


- conexions -> Contém os arquivos necessários para conectar ao banco de dados.
  - connection.rb
  - info -> Contém os arquivos de login necessários para conectar ao banco de dados.
- controller -> Contém os arquivos necessários para controle do banco de dados, podendo inserir, atualizar e excluir itens de uma tabela.
  - controller_arma.rb
  - controller_localizacao.rb
  - controller_veiculo.rb
  - controller_vilao_arma.rb
  - controller_vilao_localizacao.rb
  - controller_vilao_veiculo.rb
  - controller_vilao.rb
- create_collections_and_records.rb -> Script para criar coleções e inserir registros no banco de dados.
- main.rb -> Arquivo principal para execução do projeto.
- model -> Contém os arquivos que definem os modelos das entidades do banco de dados.
  - arma.rb
  - localizacao.rb
  - veiculo.rb
  - vilao_arma.rb
  - vilao_veiculo.rb
  - vilao.rb
- reports -> Contém os arquivos necessários para obter os relatórios.
  - relatorio_agrupamento_vilao.rb
  - relatorio_viloes_por_localizacao.rb
  - relatorio_juncao_arma_veiculo.rb
  - relatorio_detalhado_vilao_arma_veiculo_localizacao.rb
