from model.vilao import Vilao
from conexions.conexion import Conexion


class Controller_Vilao:
    def __init__(self):
        self.conn = Conexion('conexions/info/login.json', can_write=True)
        
    def inserir_vilao(self) -> Vilao:
        self.conn.connect()

        id_vilao = input("ID do Vilão (Novo): ")
        
        if not self.verifica_existencia_vilao(id_vilao):
            nome_vilao = input("Nome do Vilão (Novo): ")
            nome_verdadeiro = input("Nome Verdadeiro (Novo): ")
            print("\n")
            print(self.conn.sql_to_data_frame("SELECT ID_Localizacao, Nome_Localizacao FROM LOCALIZACAO"))
            print("\n")
            localizacao = input("ID da Localização: ")
            nivel_periculosidade = input("Nível de Periculosidade: ")

            self.conn.execute_non_query(f"""
                INSERT INTO Vilao (ID_Vilao, Nome_Vilao, Nome_Verdadeiro, Localizacao, Nivel_Periculosidade) 
                VALUES (:1, :2, :3, :4, :5)
            """, (id_vilao, nome_vilao, nome_verdadeiro, localizacao, nivel_periculosidade))

            df_vilao = self.conn.sql_to_data_frame(f"SELECT * FROM Vilao WHERE ID_Vilao = {id_vilao}")
            novo_vilao = Vilao(df_vilao['id_vilao'][0], df_vilao['nome_vilao'][0], 
                               df_vilao['nome_verdadeiro'][0], df_vilao['localizacao'][0], 
                               df_vilao['nivel_periculosidade'][0])
            print(novo_vilao.to_string())
            return novo_vilao
        else:
            print(f"O ID {id_vilao} já está cadastrado.")
            return None

    def atualizar_vilao(self) -> Vilao:
        self.conn.connect()

        id_vilao = input("ID do Vilão que deseja atualizar: ")

        if self.verifica_existencia_vilao(id_vilao):
            novo_nome = input("Nome do Vilão (Novo): ")
            novo_nome_verdadeiro = input("Nome Verdadeiro (Novo): ")            
            print("\n")
            print(self.conn.sql_to_data_frame("SELECT ID_Localizacao, Nome_Localizacao FROM LOCALIZACAO"))
            print("\n")
            novo_localizacao = input("ID da Localização: ")
            novo_nivel_periculosidade = input("Nível de Periculosidade (Novo): ")

            self.conn.execute_non_query(f"""
                UPDATE Vilao 
                SET Nome_Vilao = :1, Nome_Verdadeiro = :2, Localizacao = :3, Nivel_Periculosidade = :4 
                WHERE ID_Vilao = :5
            """, (novo_nome, novo_nome_verdadeiro, novo_localizacao, novo_nivel_periculosidade, id_vilao))

            df_vilao = self.conn.sql_to_data_frame(f"SELECT * FROM Vilao WHERE ID_Vilao = {id_vilao}")
            vilao_atualizado = Vilao(df_vilao['id_vilao'][0], df_vilao['nome_vilao'][0], 
                                     df_vilao['nome_verdadeiro'][0], df_vilao['localizacao'][0], 
                                     df_vilao['nivel_periculosidade'][0])
            print(vilao_atualizado.to_string())
            return vilao_atualizado
        else:
            print(f"O ID {id_vilao} não existe.")
            return None

    def excluir_vilao(self):
        self.conn.connect()

        id_vilao = input("ID do Vilão que deseja excluir: ")

        if self.verifica_existencia_vilao(id_vilao):
            df_vilao = self.conn.sql_to_data_frame(f"SELECT * FROM Vilao WHERE ID_Vilao = {id_vilao}")
            self.conn.execute_non_query(f"DELETE FROM Vilao WHERE ID_Vilao = {id_vilao}")
            vilao_excluido = Vilao(df_vilao['id_vilao'][0], df_vilao['nome_vilao'][0], 
                                   df_vilao['nome_verdadeiro'][0], df_vilao['localizacao'][0], 
                                   df_vilao['nivel_periculosidade'][0])
            print("Vilão Removido com Sucesso!")
            print(vilao_excluido.to_string())
        else:
            print(f"O ID {id_vilao} não existe.")

    def verifica_existencia_vilao(self, id_vilao: str) -> bool:
        df_vilao = self.conn.sql_to_data_frame(f"SELECT * FROM Vilao WHERE ID_Vilao = {id_vilao}")
        return not df_vilao.empty
