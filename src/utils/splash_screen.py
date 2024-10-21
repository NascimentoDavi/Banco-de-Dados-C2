from conexions.conexion import Conexion
from utils import config

class SplashScreen:    
    def __init__(self):
        self.qry_total_viloes = config.QUERY_COUNT.format(tabela="vilao")
        self.qry_total_armas = config.QUERY_COUNT.format(tabela="arma")
        self.qry_total_veiculos = config.QUERY_COUNT.format(tabela="veiculo")
        self.qry_total_localizacoes = config.QUERY_COUNT.format(tabela="localizacao")
        self.qry_total_viloes_armas = config.QUERY_COUNT.format(tabela="vilao_arma")
        self.qry_total_viloes_veiculos = config.QUERY_COUNT.format(tabela="vilao_veiculo")


        self.created_by = "Vinícius Cavati Gobbi, Davi Rodrigues, Luiz Otávio Kuster, Mateus Reis"
        self.professor = "Prof. M.Sc. Howard Roatti"
        self.disciplina = "Banco de Dados"
        self.semestre = "2024/2"


    def get_total_viloes(self):
        conexion = Conexion()
        conexion.connect
        return conexion.sql_to_data_frame(self.qry_total_viloes)["total_vilao"].values[0]

    def get_total_armas(self):
        conexion = Conexion()
        conexion.connect
        return conexion.sql_to_data_frame(self.qry_total_armas)["total_arma"].values[0]
    
    def get_total_veiculos(self):
        conexion = Conexion()
        conexion.connect
        return conexion.sql_to_data_frame(self.qry_total_veiculos)["total_veiculo"].values[0]
    
    def get_total_localizacoes(self):
        conexion = Conexion()
        conexion.connect
        return conexion.sql_to_data_frame(self.qry_total_localizacoes)["total_localizacao"].values[0]
    
    def get_total_viloes_armas(self):
        conexion = Conexion()
        conexion.connect
        return conexion.sql_to_data_frame(self.qry_total_viloes_armas)["total_vilao_arma"].values[0]
    
    def get_total_viloes_veiculos(self):
        conexion = Conexion()
        conexion.connect
        return conexion.sql_to_data_frame(self.qry_total_viloes_veiculos)["total_vilao_veiculo"].values[0]
    
    def get_updated_screen(self):
        return f"""
        ########################################################
        #                     BAT COMPUTADOR                     
        #                                                         
        #  TOTAL DE REGISTROS:                                    
        #      1 - VILOES:              {str(self.get_total_viloes()).rjust(5)}
        #      2 - ARMAS:               {str(self.get_total_armas()).rjust(5)}
        #      3 - VEICULOS:            {str(self.get_total_veiculos()).rjust(5)}
        #      4 - LOCALIZACOES:        {str(self.get_total_localizacoes()).rjust(5)}
        #      5 - ARMAS DE VILOES:     {str(self.get_total_viloes_armas()).rjust(5)}
        #      6 - VEICULOS DE VILOES:  {str(self.get_total_viloes_veiculos()).rjust(5)}
        #
        #  CRIADO POR: {self.created_by}
        #
        #  PROFESSOR:  {self.professor}
        #
        #  DISCIPLINA: {self.disciplina}
        #              {self.semestre}
        ########################################################
        """