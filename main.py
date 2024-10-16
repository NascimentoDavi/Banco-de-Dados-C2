import os
import json
from conexions.conexion import Conexion

def listar_tabelas():
    # Caminho para o arquivo JSON
    json_path = os.path.join('conexions', 'info', 'login.json')
    
    # Cria uma instância da classe Conexion
    conn = Conexion(json_path)

    try:
        # Conecta ao banco de dados
        conn.connect()

        # Consulta para listar todas as tabelas
        query = """
        SELECT table_name
        FROM user_tables
        ORDER BY table_name
        """
        
        # Executa a consulta e obtém os resultados
        tabelas = conn.execute_query(query)
        
        # Exibe as tabelas
        print("Tabelas no banco de dados:")
        for tabela in tabelas:
            print(tabela[0])
    except Exception as e:
        print(f"Ocorreu um erro: {e}")
    finally:
        # Garante que a conexão seja fechada
        conn.close()

if __name__ == "__main__":
    listar_tabelas()
