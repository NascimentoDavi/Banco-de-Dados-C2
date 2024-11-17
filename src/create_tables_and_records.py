from conexions.conexion import Conexion
from time import sleep
def create_tables(query:str):
    list_of_commands = query.split(";")

    oracle = Conexion("conexions/info/login.json",can_write=True)
    oracle.connect()

    for command in list_of_commands:
        if len(command) > 0:
            print(command)
            try:
                oracle.execute_query(command)
                print("Successfully executed")
            except Exception as e:
                print(e)            

def generate_records(query:str, sep:str=';'):
    list_of_commands = query.split(sep)

    oracle = Conexion("conexions/info/login.json",can_write=True)
    oracle.connect()

    for command in list_of_commands:    
        if len(command) > 0:
            print(command)
            oracle.execute_non_query(command)
            print("Successfully executed")

def run():

    with open("../sql/delete_and_create_tables.sql") as f:
        query_create = f.read()

    print("Creating tables...")
    create_tables(query=query_create)
    print("Tables successfully created!")

    with open("../sql/insert_data.sql") as f:
        query_generate_records = f.read()

    print("Gerenating records")
    generate_records(query=query_generate_records)
    print("Records successfully generated!")


if __name__ == '__main__':
    run()