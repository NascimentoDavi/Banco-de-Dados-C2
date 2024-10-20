from conexions.conexion import Conexion

class Relatorio:
    def __init__(self):
        # Carrega as consultas SQL dos arquivos
        with open("sql/relatorio_agrupamento_vilao.sql") as f:
            self.query_agrupamento_vilao = f.read()

        with open("sql/relatorio_juncao_vilao_arma_veiculo.sql") as f:
            self.query_juncao_vilao_arma_veiculo = f.read()

        with open("sql/relatorio_viloes_por_localizacao.sql") as f:
            self.query_viloes_por_localizacao = f.read()

        with open("sql/relatorio_detalhado_vilao_arma_veiculo_localizacao.sql") as f:
            self.query_detalhado_vilao_arma_veiculo_localizacao = f.read()

    def get_relatorio_agrupamento_vilao(self):
        # Cria uma nova conexão com o banco que permite alteração
        oracle = Conexion('conexions/info/login.json', can_write=False)
        oracle.connect()
        # Recupera os dados transformando em um DataFrame
        print(oracle.sql_to_data_frame(self.query_agrupamento_vilao))
        input("Pressione Enter para Sair do Relatório de Agrupamento de Vilões")

    def get_relatorio_juncao_vilao_arma_veiculo(self):
        # Cria uma nova conexão com o banco
        oracle = Conexion('conexions/info/login.json', can_write=False)
        oracle.connect()
        # Recupera os dados transformando em um DataFrame
        print(oracle.sql_to_data_frame(self.query_juncao_vilao_arma_veiculo))
        input("Pressione Enter para Sair do Relatório de Junção de Vilões, Armas e Veículos")

    def get_relatorio_viloes_por_localizacao(self):
        # Cria uma nova conexão com o banco
        oracle = Conexion('conexions/info/login.json', can_write=False)
        oracle.connect()
        # Recupera os dados transformando em um DataFrame
        print(oracle.sql_to_data_frame(self.query_viloes_por_localizacao))
        input("Pressione Enter para Sair do Relatório de Vilões por Localização")

    def get_relatorio_detalhado_vilao_arma_veiculo_localizacao(self):
        # Cria uma nova conexão com o banco
        oracle = Conexion('conexions/info/login.json', can_write=False)
        oracle.connect()
        # Recupera os dados transformando em um DataFrame
        print(oracle.sql_to_data_frame(self.query_detalhado_vilao_arma_veiculo_localizacao))
        input("Pressione Enter para Sair do Relatório Detalhado de Vilões, Armas, Veículos e Localização")
