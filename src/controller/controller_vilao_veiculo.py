from conexions.conexion import Conexion


class Controller_Vilao_Veiculo:
    def __init__(self):
        self.conn = Conexion('conexions/info/login.json', can_write=True)

    def inserir_vilao_veiculo(self):
        self.conn.connect()

        id_vilao = input("ID do Vilão: ")
        id_veiculo = input("ID do Veículo: ")

        if not self.verifica_existencia_vilao_veiculo(id_vilao, id_veiculo):
            self.conn.execute_non_query(f"""
                INSERT INTO Vilao_Veiculo (ID_Vilao, ID_Veiculo) 
                VALUES (:1, :2)
            """, (id_vilao, id_veiculo))
            print(f"Associação Vilão {id_vilao} com Veículo {id_veiculo} inserida com sucesso.")
        else:
            print(f"A associação Vilão {id_vilao} com Veículo {id_veiculo} já existe.")

    def excluir_vilao_veiculo(self):
        self.conn.connect()

        id_vilao = input("ID do Vilão: ")
        id_veiculo = input("ID do Veículo: ")

        if self.verifica_existencia_vilao_veiculo(id_vilao, id_veiculo):
            self.conn.execute_non_query(f"DELETE FROM Vilao_Veiculo WHERE ID_Vilao = {id_vilao} AND ID_Veiculo = {id_veiculo}")
            print(f"Associação Vilão {id_vilao} com Veículo {id_veiculo} removida com sucesso.")
        else:
            print(f"A associação Vilão {id_vilao} com Veículo {id_veiculo} não existe.")

    def verifica_existencia_vilao_veiculo(self, id_vilao: str, id_veiculo: str) -> bool:
        df_vilao_veiculo = self.conn.sql_to_data_frame(f"SELECT * FROM Vilao_Veiculo WHERE ID_Vilao = {id_vilao} AND ID_Veiculo = {id_veiculo}")
        return not df_vilao_veiculo.empty
