from conexions.conexion import Conexion

def testar_conexao():
    conexao = None
    try:
        Conexion.executeDDL("SELECT * FROM dual")
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
