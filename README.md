# Trabalho avaliativo da C2 Banco de Dados

Esse é um projeto desenvolvido para a matéria de banco de dados

---
## Grupo

| Membros do grupo   |
| ------------------ |
| Davi Rodrigues     |
| Luiz Otávio Kuster |
| Mateus Reis        |
| Vinícius Cavati    |

---

## Como rodar:

### Pré requisitos

Para rodar, será necessário criar as tabelas, para isso utilize o comando

```bash
$ python create_tables_and_records.py 
```

Caso não funcione você pode tentar:

```bash
$ python3 create_tables_and_records.py 
```

Ao rodar esse comando ele vai gerar a tabela, inserir as localizações que é um pré requisito, e como bonus vai inserir alguns itens para a tabela não iniciar vazia!


### Rodando o projeto

Para iniciar o projeto você pode rodar o arquivo [main.py](src/main.py) com o comando:

```bash

$ python main.py

```

Caso não funcione, você pode tentar:

```bash

$ python3 main.py

```

---

## Estrutura de arquivos

- **Edital** -> Pasta com o edital do trabalho, contendo todas as instruções para execução do trabalho

- **sql** -> Pasta com os arquivos para geração das tabelas e inserção dos dados de exemplo

- **src** -> Pasta com todo o código fonte dos arquivos
    
    - **conexions** -> Contem os arquivos necessários para conectar ao banco de dados

        - **info** -> Contem os arquivos de login necessários para conectar ao banco de dados
    
    - **controller** -> Contem os arquivos necessários para controle do banco de dados, podendo inserir, atualizar e excluir itens de uma tabela

    - **model** -> Contem os arquivos que contem os contrutores das entidades do banco de dados

    - **reports** -> Contem os arquivos necessários para obter os relatórios

    - **sql** -> Contem as consultas necessárias para obter os relatórios

    - **utils** -> Contem os arquivos necessários para criar as telas de interação dos menu e Splash Screen