from model.arma import Arma
from conexions.conexion import Conexion

class Controller_Arma:
    def __init__(self):
        self.conn = Conexion('conexions/info/login.json', can_write=True)

    def inserir_arma(self) -> Arma:
        self.conn.connect()

        id_arma = input("ID da Arma (Novo): ")

        if not self.verifica_existencia_arma(id_arma):
            tipo_arma = input("Tipo da Arma (Novo): ")
            descricao_arma = input("Descrição da Arma (Nova): ")

            self.conn.execute_non_query(f"""
                INSERT INTO Arma (ID_Arma, Tipo_Arma, Descricao_Arma) 
                VALUES (:1, :2, :3)
            """, (id_arma, tipo_arma, descricao_arma))

            df_arma = self.conn.sql_to_data_frame(f"SELECT * FROM Arma WHERE ID_Arma = {id_arma}")
            nova_arma = Arma(df_arma['id_arma'][0], df_arma['tipo_arma'][0], df_arma['descricao_arma'][0])
            print(nova_arma.to_string())
            return nova_arma
        else:
            print(f"O ID {id_arma} já está cadastrado.")
            return None

    def atualizar_arma(self) -> Arma:
        self.conn.connect()

        id_arma = input("ID da Arma que deseja atualizar: ")

        if self.verifica_existencia_arma(id_arma):
            novo_tipo = input("Tipo da Arma (Novo): ")
            nova_descricao = input("Descrição da Arma (Nova): ")

            self.conn.execute_non_query(f"""
                UPDATE Arma 
                SET Tipo_Arma = :1, Descricao_Arma = :2 
                WHERE ID_Arma = :3
            """, (novo_tipo, nova_descricao, id_arma))

            df_arma = self.conn.sql_to_data_frame(f"SELECT * FROM Arma WHERE ID_Arma = {id_arma}")
            arma_atualizada = Arma(df_arma['id_arma'][0], df_arma['tipo_arma'][0], df_arma['descricao_arma'][0])
            print(arma_atualizada.to_string())
            return arma_atualizada
        else:
            print(f"O ID {id_arma} não existe.")
            return None

    def excluir_arma(self):
        self.conn.connect()

        id_arma = input("ID da Arma que deseja excluir: ")

        if self.verifica_existencia_arma(id_arma):
            df_arma = self.conn.sql_to_data_frame(f"SELECT * FROM Arma WHERE ID_Arma = {id_arma}")
            self.conn.execute_non_query(f"DELETE FROM Arma WHERE ID_Arma = {id_arma}")
            arma_excluida = Arma(df_arma['id_arma'][0], df_arma['tipo_arma'][0], df_arma['descricao_arma'][0])
            print("Arma Removida com Sucesso!")
            print(arma_excluida.to_string())
        else:
            print(f"O ID {id_arma} não existe.")

    def verifica_existencia_arma(self, id_arma: str) -> bool:
        df_arma = self.conn.sql_to_data_frame(f"SELECT * FROM Arma WHERE ID_Arma = {id_arma}")
        return not df_arma.empty
