import json
import cx_Oracle
from pandas import DataFrame

class Conexion:
    def __init__(self, config_file, can_write:bool=False):
        self.config_file = config_file
        self.can_write = can_write
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
            self.cursor = self.connection.cursor()
            return self.cursor
        except cx_Oracle.DatabaseError as e:
            raise Exception(f"Erro ao conectar ao banco de dados: {e}")
        
    def sql_to_data_frame(self, query:str) -> DataFrame:
        '''
        Esse método irá executar uma query
        Parameters:
        - query: consulta utilizada para recuperação dos dados
        return: um DataFrame da biblioteca Pandas
        '''

        if self.connection is None:
            raise Exception("Conexão não estabelecida. Chame o método connect() primeiro.")
        
        self.cursor.execute(query)
        rows = self.cursor.fetchall()
        return DataFrame(rows, columns=[col[0].lower() for col in self.cursor.description])
        
    def sql_to_json(self, query:str):
        '''
        Esse método irá executar uma query
        Parameters:
        - query: consulta utilizada para recuperação dos dados
        return: um objeto json
        '''
        self.cursor.execute(query)
        columns = [col[0].lower() for col in self.cursor.description]
        self.cursor.rowfactory = lambda *args: dict(zip(columns, args))
        rows = self.cursor.fetchall()
        return json.dumps(rows, default=str)

    def execute_query(self, query, params=None):
        """Executa uma consulta no banco de dados e retorna os resultados."""
        if self.connection is None:
            raise Exception("Conexão não estabelecida. Chame o método connect() primeiro.")
        
        self.cursor.execute(query, params or {})

    def execute_non_query(self, query, params=None):
        """Executa uma consulta não retornadora (INSERT, UPDATE, DELETE)."""
        if self.connection is None:
            raise Exception("Conexão não estabelecida. Chame o método connect() primeiro.")
        
        if self.can_write == False:
            raise Exception("Conexão apenas de leitura. Não é possível executar operações de escrita.")
        
        
        self.cursor.execute(query, params or {})
        self.connection.commit()

    def close(self):
        """Fecha a conexão com o banco de dados."""
        if self.connection:
            self.connection.close()
            self.connection = None
