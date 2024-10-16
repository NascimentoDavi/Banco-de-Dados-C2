import json
import cx_Oracle

class Conexion:
    def __init__(self, config_file):
        self.config_file = config_file
        self.connection = None
        self.load_config()
        self.create_dsn()

    def load_config(self):
        """Carrega as configurações do arquivo JSON."""
        with open(self.config_file, 'r') as file:
            config = json.load(file)
            self.host = config['host']
            self.port = config['port']
            self.service_name = config['service_name']
            self.sid = config['sid']
            self.username = config['user']
            self.password = config['password']
            self.can_write = config['can_write']

    def create_dsn(self):
        """Cria a string de conexão (DSN) a partir dos parâmetros carregados."""
        if self.sid:
            self.dsn = cx_Oracle.makedsn(self.host, self.port, sid=self.sid)
        else:
            self.dsn = cx_Oracle.makedsn(self.host, self.port, service_name=self.service_name)

    def connect(self):
        """Estabelece a conexão com o banco de dados."""
        if self.connection is not None:
            return  # Já está conectado
        try:
            self.connection = cx_Oracle.connect(
                user=self.username,
                password=self.password,
                dsn=self.dsn
            )
        except cx_Oracle.DatabaseError as e:
            raise Exception(f"Erro ao conectar ao banco de dados: {e}")

    def execute_query(self, query, params=None):
        """Executa uma consulta no banco de dados e retorna os resultados."""
        if self.connection is None:
            raise Exception("Conexão não estabelecida. Chame o método connect() primeiro.")
        
        with self.connection.cursor() as cursor:
            cursor.execute(query, params or {})
            return cursor.fetchall()

    def execute_non_query(self, query, params=None):
        """Executa uma consulta não retornadora (INSERT, UPDATE, DELETE)."""
        if self.connection is None:
            raise Exception("Conexão não estabelecida. Chame o método connect() primeiro.")
        
        if not self.can_write:
            raise Exception("Conexão apenas de leitura. Não é possível executar operações de escrita.")
        
        with self.connection.cursor() as cursor:
            cursor.execute(query, params or {})
            self.connection.commit()

    def close(self):
        """Fecha a conexão com o banco de dados."""
        if self.connection:
            self.connection.close()
            self.connection = None

# Exemplo de uso
if __name__ == "__main__":
    conn = Conexion('conexions/info/login.json')
    try:
        conn.connect()
        resultados = conn.execute_query("SELECT * FROM CLIENTES")
        print(resultados)
        
        if conn.can_write:
            conn.execute_non_query("INSERT INTO sua_tabela (coluna1, coluna2) VALUES (:1, :2)", ("valor1", "valor2"))
    finally:
        conn.close()
