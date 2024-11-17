from conexions.conexion import Conexion


class Controller_Vilao_Arma:
    def __init__(self):
        self.conn = Conexion('conexions/info/login.json', can_write=True)

    def inserir_vilao_arma(self):
        self.conn.connect()

        id_vilao = input("ID do Vilão: ")
        id_arma = input("ID da Arma: ")

        if not self.verifica_existencia_vilao_arma(id_vilao, id_arma):
            self.conn.execute_non_query(f"""
                INSERT INTO Vilao_Arma (ID_Vilao, ID_Arma) 
                VALUES (:1, :2)
            """, (id_vilao, id_arma))
            print(f"Associação Vilão {id_vilao} com Arma {id_arma} inserida com sucesso.")
        else:
            print(f"A associação Vilão {id_vilao} com Arma {id_arma} já existe.")

    def excluir_vilao_arma(self):
        self.conn.connect()

        id_vilao = input("ID do Vilão: ")
        id_arma = input("ID da Arma: ")

        if self.verifica_existencia_vilao_arma(id_vilao, id_arma):
            self.conn.execute_non_query(f"DELETE FROM Vilao_Arma WHERE ID_Vilao = {id_vilao} AND ID_Arma = {id_arma}")
            print(f"Associação Vilão {id_vilao} com Arma {id_arma} removida com sucesso.")
        else:
            print(f"A associação Vilão {id_vilao} com Arma {id_arma} não existe.")

    def verifica_existencia_vilao_arma(self, id_vilao: str, id_arma: str) -> bool:
        df_vilao_arma = self.conn.sql_to_data_frame(f"SELECT * FROM Vilao_Arma WHERE ID_Vilao = {id_vilao} AND ID_Arma = {id_arma}")
        return not df_vilao_arma.empty
