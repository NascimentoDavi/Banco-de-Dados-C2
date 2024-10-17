class Localizacao:
    def __init__(self, 
                 id_localizacao:int=None, 
                 nome_localizacao:str=None, 
                 tipo_localizacao:str=None):
        self.set_id_localizacao(id_localizacao)
        self.set_nome_localizacao(nome_localizacao)
        self.set_tipo_localizacao(tipo_localizacao)

    def set_id_localizacao(self, id_localizacao:int):
        self.id_localizacao = id_localizacao

    def set_nome_localizacao(self, nome_localizacao:str):
        self.nome_localizacao = nome_localizacao

    def set_tipo_localizacao(self, tipo_localizacao:str):
        self.tipo_localizacao = tipo_localizacao

    def get_id_localizacao(self) -> int:
        return self.id_localizacao

    def get_nome_localizacao(self) -> str:
        return self.nome_localizacao

    def get_tipo_localizacao(self) -> str:
        return self.tipo_localizacao

    def to_string(self) -> str:
        return f"Localização: {self.get_nome_localizacao()} | Tipo: {self.get_tipo_localizacao()}"
