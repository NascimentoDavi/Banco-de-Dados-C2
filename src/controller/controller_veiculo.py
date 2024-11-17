from model.veiculo import Veiculo
from conexions.conexion import Conexion


class Controller_Veiculo:
    def __init__(self):
        self.conn = Conexion('conexions/info/login.json', can_write=True)

    def inserir_veiculo(self) -> Veiculo:
        self.conn.connect()

        id_veiculo = input("ID do Veículo (Novo): ")

        if not self.verifica_existencia_veiculo(id_veiculo):
            tipo_veiculo = input("Tipo do Veículo (Novo): ")
            descricao_veiculo = input("Descrição do Veículo (Nova): ")

            self.conn.execute_non_query(f"""
                INSERT INTO Veiculo (ID_Veiculo, Tipo_Veiculo, Descricao_Veiculo) 
                VALUES (:1, :2, :3)
            """, (id_veiculo, tipo_veiculo, descricao_veiculo))

            df_veiculo = self.conn.sql_to_data_frame(f"SELECT * FROM Veiculo WHERE ID_Veiculo = {id_veiculo}")
            novo_veiculo = Veiculo(df_veiculo['id_veiculo'][0], df_veiculo['tipo_veiculo'][0], df_veiculo['descricao_veiculo'][0])
            print(novo_veiculo.to_string())
            return novo_veiculo
        else:
            print(f"O ID {id_veiculo} já está cadastrado.")
            return None

    def atualizar_veiculo(self) -> Veiculo:
        self.conn.connect()

        id_veiculo = input("ID do Veículo que deseja atualizar: ")

        if self.verifica_existencia_veiculo(id_veiculo):
            novo_tipo = input("Tipo do Veículo (Novo): ")
            nova_descricao = input("Descrição do Veículo (Nova): ")

            self.conn.execute_non_query(f"""
                UPDATE Veiculo 
                SET Tipo_Veiculo = :1, Descricao_Veiculo = :2 
                WHERE ID_Veiculo = :3
            """, (novo_tipo, nova_descricao, id_veiculo))

            df_veiculo = self.conn.sql_to_data_frame(f"SELECT * FROM Veiculo WHERE ID_Veiculo = {id_veiculo}")
            veiculo_atualizado = Veiculo(df_veiculo['id_veiculo'][0], df_veiculo['tipo_veiculo'][0], df_veiculo['descricao_veiculo'][0])
            print(veiculo_atualizado.to_string())
            return veiculo_atualizado
        else:
            print(f"O ID {id_veiculo} não existe.")
            return None

    def excluir_veiculo(self):
        self.conn.connect()

        id_veiculo = input("ID do Veículo que deseja excluir: ")

        if self.verifica_existencia_veiculo(id_veiculo):
            df_veiculo = self.conn.sql_to_data_frame(f"SELECT * FROM Veiculo WHERE ID_Veiculo = {id_veiculo}")
            self.conn.execute_non_query(f"DELETE FROM Veiculo WHERE ID_Veiculo = {id_veiculo}")
            veiculo_excluido = Veiculo(df_veiculo['id_veiculo'][0], df_veiculo['tipo_veiculo'][0], df_veiculo['descricao_veiculo'][0])
            print("Veículo Removido com Sucesso!")
            print(veiculo_excluido.to_string())
        else:
            print(f"O ID {id_veiculo} não existe.")

    def verifica_existencia_veiculo(self, id_veiculo: str) -> bool:
        df_veiculo = self.conn.sql_to_data_frame(f"SELECT * FROM Veiculo WHERE ID_Veiculo = {id_veiculo}")
        return not df_veiculo.empty
