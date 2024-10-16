import json
import cx_Oracle

class Conexion:
    login = json.load(open('conexions/info/login.json')) #arquivo de login padrao
    
    def __init__(self):
        self.can_write = Conexion.login['can_write']
        self.host = Conexion.login['host']
        self.port = Conexion.login['port']
        self.service_name = Conexion.login['service_name']
        self.sid = Conexion.login['sid']
        self.user = Conexion.login['user']
        self.password = Conexion.login['password']  # Corrigido para 'password'
        self.conn = None
        self.cur = None

    def __del__(self):
        if self.cur:
            self.cur.close()
        if self.conn:
            self.conn.close()

    def connectionString(self, in_container:bool=False):
        if not in_container:
            string_connection = cx_Oracle.makedsn(host=self.host,
                                                port=self.port,
                                                sid=self.sid)
        else:
            string_connection = cx_Oracle.makedsn(host=self.host,
                                                port=self.port,
                                                service_name=self.service_name)
        return string_connection

    def connect(self):
        self.conn = cx_Oracle.connect(user=self.user,
                                    password=self.password,  # Corrigido para 'password'
                                    dsn=self.connectionString())
        self.cur = self.conn.cursor()
        return self.cur
