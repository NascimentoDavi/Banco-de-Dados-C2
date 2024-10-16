from conexions.conexion import Conexion

def testar_conexao():
    conexao = None
    try:
        # Instancia a classe Conexion
        conexao = Conexion()
        
        # Tenta realizar a conexão
        cursor = conexao.connect()
        
        # Se a conexão for bem-sucedida, imprime uma mensagem de sucesso
        print("Conexão estabelecida com sucesso!")
        
        # Executa uma query de teste
        cursor.execute("SELECT * FROM dual")
        result = cursor.fetchone()
        print("Consulta de teste realizada:", result)
        
    except Exception as e:
        # Em caso de erro, exibe a mensagem
        print("Erro ao conectar ao banco de dados:", str(e))
    
    finally:
        # Garante que a conexão será fechada
        if conexao and conexao.cur:
            conexao.__del__()

# Executa o teste
if __name__ == "__main__":
    testar_conexao()
